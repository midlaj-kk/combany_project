import 'dart:async';
import 'package:auto_care_app/core/router/app_router.dart';
import 'package:auto_care_app/core/theme/app_colors.dart';
import 'package:auto_care_app/core/theme/app_text_styles.dart';
import 'package:auto_care_app/features/splash/widgets/glowing_logo.dart';
import 'package:auto_care_app/features/splash/widgets/loading_dots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_care_app/features/auth/bloc/bloc.dart';
import 'package:auto_care_app/features/auth/bloc/state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;

    final authBloc = context.read<AuthBloc>();
    var state = authBloc.state;

    if (state is! AuthAuthenticated && state is! AuthUnauthenticated) {
      try {
        state = await authBloc.stream.firstWhere(
          (s) => s is AuthAuthenticated || s is AuthUnauthenticated,
        ).timeout(const Duration(seconds: 10));
      } on TimeoutException {
        state = AuthUnauthenticated();
      }
    }

    if (!mounted) return;

    if (state is AuthAuthenticated) {
      AppRouter.afterLogin(context, state.user.role);
    } else {
      AppRouter.toLogin(context, replace: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(painter: _DotGridPainter()),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const GlowingLogo(),
                const SizedBox(height: 28),
                Text('AutoCare Pro', style: AppTextStyles.heading1),
                const SizedBox(height: 8),
                Text(
                  'Workshop Management, Simplified',
                  style: AppTextStyles.bodySecondary,
                ),
              ],
            ),
          ),

          const Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(child: LoadingDots()),
          ),
        ],
      ),
    );
  }
}

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withValues(alpha: 0.03);
    const spacing = 24.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
