abstract class AuthEvent {
  const AuthEvent();
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  const AuthLoginRequested({required this.email, required this.password});
}

class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested();
}

class AuthCheckStatus extends AuthEvent {
  const AuthCheckStatus();
}

class AuthGetCurrentUser extends AuthEvent {
  const AuthGetCurrentUser();
}
