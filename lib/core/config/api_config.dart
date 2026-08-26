class ApiConfig {
  ApiConfig._();

  static const String baseUrl = 'https://autocare-backend-iz74.onrender.com';
  static const String apiVersion = '/api/v1';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);
}
