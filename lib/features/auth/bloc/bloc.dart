import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/auth_service.dart';
import 'event.dart';
import 'state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({required this.authService}) : super(const AuthInitial()) {
    on<AuthLoginRequested>(_onLogin);
    on<AuthLogoutRequested>(_onLogout);
    on<AuthCheckStatus>(_onCheckStatus);
    on<AuthGetCurrentUser>(_onGetCurrentUser);
  }

  Future<void> _onLogin(AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final user = await authService.login(
        email: event.email,
        password: event.password,
      );
      if (user != null) {
        emit(AuthAuthenticated(user: user));
      } else {
        emit(const AuthError(message: 'Login failed. Please check your credentials.'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onLogout(AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    await authService.logout();
    emit(const AuthUnauthenticated());
  }

  Future<void> _onCheckStatus(AuthCheckStatus event, Emitter<AuthState> emit) async {
    // Only a session we explicitly marked as logged-in with a stored access
    // token is considered. Stale keys (e.g. a leftover token) do not count.
    if (!await authService.isLoggedIn()) {
      if (await authService.getAccessToken() != null) {
        // There is a leftover token but no confirmed session; wipe it so a
        // restart can never be mistaken for a logged-in user.
        await authService.clearLocalSession();
      }
      emit(const AuthUnauthenticated());
      return;
    }

    // Re-validate the stored session against the server. An expired or
    // blacklisted session is cleared and the user is sent to the login screen.
    final user = await authService.getCurrentUser();
    if (user != null) {
      emit(AuthAuthenticated(user: user));
    } else {
      await authService.clearLocalSession();
      emit(const AuthUnauthenticated());
    }
  }

  Future<void> _onGetCurrentUser(AuthGetCurrentUser event, Emitter<AuthState> emit) async {
    try {
      final user = await authService.getCurrentUser();
      if (user != null) {
        emit(AuthAuthenticated(user: user));
      } else {
        emit(const AuthError(message: 'Failed to load user data.'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
