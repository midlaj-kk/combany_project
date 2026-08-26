import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../admin/data/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../core/error/result.dart';

// ── Events ───────────────────────────────────────────────────────────────────

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginRequested({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
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

// ── States ───────────────────────────────────────────────────────────────────

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  final UserModel user;

  const AuthAuthenticated({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}

// ── Bloc ─────────────────────────────────────────────────────────────────────

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(const AuthInitial()) {
    on<AuthLoginRequested>(_onLogin);
    on<AuthLogoutRequested>(_onLogout);
    on<AuthCheckStatus>(_onCheckStatus);
    on<AuthGetCurrentUser>(_onGetCurrentUser);
  }

  Future<void> _onLogin(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    final result = await authRepository.login(
      email: event.email,
      password: event.password,
    );
    switch (result) {
      case Success<UserModel>():
        emit(AuthAuthenticated(user: result.data));
      case FailureResult<UserModel>():
        emit(AuthError(message: result.message));
    }
  }

  Future<void> _onLogout(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    await authRepository.logout();
    emit(const AuthUnauthenticated());
  }

  Future<void> _onCheckStatus(
    AuthCheckStatus event,
    Emitter<AuthState> emit,
  ) async {
    final isLoggedIn = await authRepository.isLoggedIn();
    if (!isLoggedIn) {
      emit(const AuthUnauthenticated());
      return;
    }

    final result = await authRepository.getCurrentUser();
    switch (result) {
      case Success<UserModel>():
        emit(AuthAuthenticated(user: result.data));
      case FailureResult<UserModel>():
        emit(const AuthUnauthenticated());
    }
  }

  Future<void> _onGetCurrentUser(
    AuthGetCurrentUser event,
    Emitter<AuthState> emit,
  ) async {
    final result = await authRepository.getCurrentUser();
    switch (result) {
      case Success<UserModel>():
        emit(AuthAuthenticated(user: result.data));
      case FailureResult<UserModel>():
        emit(AuthError(message: result.message));
    }
  }
}
