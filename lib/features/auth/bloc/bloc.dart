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
      final success = await authService.login(
        email: event.email,
        password: event.password,
      );
      if (!success) {
        emit(const AuthError(message: 'Login failed. Please check your credentials.'));
        return;
      }
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

  Future<void> _onLogout(AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    await authService.logout();
    emit(const AuthUnauthenticated());
  }

  Future<void> _onCheckStatus(AuthCheckStatus event, Emitter<AuthState> emit) async {
    final isLoggedIn = await authService.isLoggedIn();
    if (!isLoggedIn) {
      emit(const AuthUnauthenticated());
      return;
    }
    final user = await authService.getCurrentUser();
    if (user != null) {
      emit(AuthAuthenticated(user: user));
    } else {
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
