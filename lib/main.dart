import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'features/splash/screens/splash_screen.dart';
import 'features/auth/bloc/bloc.dart';
import 'features/auth/bloc/event.dart';
import 'features/auth/bloc/state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const AutoCareApp());
}

class AutoCareApp extends StatefulWidget {
  const AutoCareApp({super.key});

  @override
  State<AutoCareApp> createState() => _AutoCareAppState();
}

class _AutoCareAppState extends State<AutoCareApp> {
  /// Tracks the previous auth state so the root listener only reacts to real
  /// transitions. The splash screen decides the very first route; this listener
  /// only bounces the user to the login screen when an already-active session
  /// ends (logout, expired/blacklisted tokens).
  AuthState? _previousAuthState;

  void _onAuthChanged(BuildContext context, AuthState state) {
    if (state is AuthUnauthenticated &&
        _previousAuthState is AuthAuthenticated) {
      AppRouter.navigateToLogin();
    }
    _previousAuthState = state;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => getIt<AuthBloc>()..add(const AuthCheckStatus()),
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: _onAuthChanged,
        child: MaterialApp(
          title: 'AutoCare Pro',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dark,
          navigatorKey: AppRouter.navigatorKey,
          navigatorObservers: [AppRouter.routeObserver],
          home: const SplashScreen(),
        ),
      ),
    );
  }
}