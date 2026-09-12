import 'package:dio/dio.dart';

import '../config/api_config.dart';

// this class creates the dio instance used for all our api calls.
// it sets the base url and timeouts, and adds our interceptors.
class DioClient {
  late final Dio _dio;

  DioClient({String? baseUrl}) {
    // set up the base options for dio.
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // add our interceptors in order.
    _dio.interceptors.addAll([
      AuthInterceptor(_dio),
      LogInterceptor(requestBody: true, responseBody: true),
      ErrorInterceptor(),
    ]);
  }

  // other classes use this getter to access dio.
  Dio get dio => _dio;
}

// this interceptor adds the access token to the request headers. 
// it also refreshes the token when we get a 401 error.
class AuthInterceptor extends Interceptor {
  final Dio _dio;

  // these are set from injection.dart so we don't need to
  // know how the tokens are stored.
  static Future<String?> Function()? getToken;
  static Future<String?> Function()? getRefreshToken;
  static Future<void> Function(String access, String? refresh)? setTokens;
  static Future<void> Function()? clearTokens;

  AuthInterceptor(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // read the token and add it to the headers.
    final token = await getToken?.call();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // we don't want to refresh the token again if the refresh request
    // itself failed, otherwise it would loop forever.
    final isRefreshRequest = err.requestOptions.path.contains('/auth/refresh/');

    // never refresh twice for the same request, or a genuinely forbidden
    // request would keep spinning the refresh logic forever.
    final alreadyRetried = err.requestOptions.extra['auth_retried'] == true;

    // only try to refresh when we got a 401 and it's not the refresh call.
    if (!isRefreshRequest &&
        !alreadyRetried &&
        err.response?.statusCode == 401) {
      final refreshToken = await getRefreshToken?.call();

      if (refreshToken != null && refreshToken.isNotEmpty) {
        try {
          // call the backend to get a new access token.
          final response = await _dio.post(
            '/api/v1/auth/refresh/',
            data: {'refresh': refreshToken},
          );

          var refreshBody = response.data;
          if (refreshBody is Map<String, dynamic> &&
              refreshBody.containsKey('success') &&
              refreshBody.containsKey('data')) {
            refreshBody = refreshBody['data'];
          }
          final newAccess =
              (refreshBody is Map<String, dynamic>) ? refreshBody['access'] as String? : null;
          // SimpleJWT returns a rotated refresh token too; keep it so the next
          // refresh doesn't try to use a blacklisted token.
          final newRefresh =
              (refreshBody is Map<String, dynamic>) ? refreshBody['refresh'] as String? : null;

          if (newAccess != null) {
            // save the new tokens so the next requests use them.
            await setTokens?.call(newAccess, newRefresh);

            // put the new token on the original request and retry it once.
            err.requestOptions.headers['Authorization'] = 'Bearer $newAccess';
            err.requestOptions.extra['auth_retried'] = true;
            final retried = await _dio.fetch(err.requestOptions);

            if (retried.statusCode == 401) {
              // the retry still failed => the session is no longer valid.
              await clearTokens?.call();
            } else {
              return handler.resolve(retried);
            }
          } else {
            // refresh succeeded but no usable token came back.
            await clearTokens?.call();
          }
        } catch (_) {
          // the refresh failed, so log the user out.
          await clearTokens?.call();
        }
      }
    }

    // if we made it here, just pass the error along.
    handler.next(err);
  }
}

// this interceptor turns dio errors into readable messages.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message;

    // pick a message based on the type of error.
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      message = 'Connection timed out. Please check your internet connection.';
    } else if (err.type == DioExceptionType.connectionError) {
      message = 'No internet connection.';
    } else if (err.type == DioExceptionType.badResponse) {
      // for a bad response we use the status code and the body.
      message = _handleBadResponse(err.response?.statusCode, err.response?.data);
    } else if (err.type == DioExceptionType.cancel) {
      message = 'Request was cancelled.';
    } else {
      message = 'An unexpected error occurred.';
    }

    // create a new error with our message so the ui can show it.
    handler.next(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: message,
    ));
  }

  // get the best message from the backend response.
  String _handleBadResponse(int? statusCode, dynamic data) {
    if (data is Map<String, dynamic>) {
      // the backend wraps its errors as { success, message, errors }.
      if (data['message'] is String &&
          (data['message'] as String).isNotEmpty) {
        return data['message'] as String;
      }

      // django also sends a "detail" message for errors.
      if (data.containsKey('detail')) {
        return data['detail'].toString();
      }

      // sometimes it sends a map of field name to a list of errors.
      final errors = <String>[];
      data.forEach((key, value) {
        if (value is List) {
          errors.add('$key: ${value.join(', ')}');
        }
      });
      if (errors.isNotEmpty) {
        return errors.join('\n');
      }
    }

    // fall back to a message based on the status code.
    if (statusCode == 400) {
      return 'Bad request. Please check your input.';
    }
    if (statusCode == 403) {
      return "You don't have permission to perform this action.";
    }
    if (statusCode == 404) {
      return 'The requested resource was not found.';
    }
    if (statusCode == 500) {
      return 'Server error. Please try again later.';
    }
    return 'An error occurred (${statusCode ?? "unknown"}).';
  }
}
