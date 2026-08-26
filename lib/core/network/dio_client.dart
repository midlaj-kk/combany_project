import 'package:dio/dio.dart';

import '../config/api_config.dart';

class DioClient {
  late final Dio _dio;

  DioClient({String? baseUrl}) {
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

    _dio.interceptors.addAll([
      AuthInterceptor(_dio),
      LogInterceptor(requestBody: true, responseBody: true),
      ErrorInterceptor(),
    ]);
  }

  Dio get dio => _dio;
}

class AuthInterceptor extends Interceptor {
  final Dio _dio;

  static String Function()? getToken;
  static String Function()? getRefreshToken;
  static Future<void> Function(String)? setTokens;
  static Future<void> Function()? clearTokens;

  AuthInterceptor(this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = getToken?.call();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = getRefreshToken?.call();
      if (refreshToken != null && refreshToken.isNotEmpty) {
        try {
          final response = await _dio.post(
            '/api/v1/auth/refresh/',
            data: {'refresh': refreshToken},
          );
          final newAccess = response.data['access'] as String?;
          if (newAccess != null) {
            await setTokens?.call(newAccess);
            err.requestOptions.headers['Authorization'] = 'Bearer $newAccess';
            final response = await _dio.fetch(err.requestOptions);
            return handler.resolve(response);
          }
        } catch (_) {
          await clearTokens?.call();
        }
      }
    }
    handler.next(err);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message;
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        message =
            'Connection timed out. Please check your internet connection.';
        break;
      case DioExceptionType.connectionError:
        message = 'No internet connection.';
        break;
      case DioExceptionType.badResponse:
        message = _handleBadResponse(
            err.response?.statusCode, err.response?.data);
        break;
      case DioExceptionType.cancel:
        message = 'Request was cancelled.';
        break;
      default:
        message = 'An unexpected error occurred.';
    }

    handler.next(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: message,
    ));
  }

  String _handleBadResponse(int? statusCode, dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data.containsKey('detail')) {
        return data['detail'].toString();
      }
      final errors = <String>[];
      data.forEach((key, value) {
        if (value is List) {
          errors.add('$key: ${value.join(', ')}');
        }
      });
      if (errors.isNotEmpty) return errors.join('\n');
    }

    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 403:
        return "You don't have permission to perform this action.";
      case 404:
        return 'The requested resource was not found.';
      case 500:
        return 'Server error. Please try again later.';
      default:
        return 'An error occurred (${statusCode ?? "unknown"}).';
    }
  }
}
