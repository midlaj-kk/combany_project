class ServerException implements Exception {
  final String message;
  final int? statusCode;

  const ServerException({required this.message, this.statusCode});
}

class CacheException implements Exception {
  final String message;

  const CacheException({required this.message});
}

class NetworkException implements Exception {
  final String message;

  const NetworkException({required this.message});
}

class ValidationException implements Exception {
  final String message;

  const ValidationException({required this.message});
}

class UnauthorizedException implements Exception {
  final String message;

  const UnauthorizedException(
      {this.message = 'Session expired. Please login again.'});
}
