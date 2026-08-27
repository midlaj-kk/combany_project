class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}

class TokenResponse {
  final String access;
  final String refresh;

  TokenResponse({
    required this.access,
    required this.refresh,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      access: json['access'] as String,
      refresh: json['refresh'] as String,
    );
  }
}

class RefreshRequest {
  final String refresh;

  RefreshRequest({
    required this.refresh,
  });

  factory RefreshRequest.fromJson(Map<String, dynamic> json) {
    return RefreshRequest(
      refresh: json['refresh'] as String,
    );
  }
}

class RefreshResponse {
  final String access;

  RefreshResponse({
    required this.access,
  });

  factory RefreshResponse.fromJson(Map<String, dynamic> json) {
    return RefreshResponse(
      access: json['access'] as String,
    );
  }
}

class LogoutRequest {
  final String refresh;

  LogoutRequest({
    required this.refresh,
  });

  factory LogoutRequest.fromJson(Map<String, dynamic> json) {
    return LogoutRequest(
      refresh: json['refresh'] as String,
    );
  }
}
