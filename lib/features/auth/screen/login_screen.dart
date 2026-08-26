import 'package:auto_care_app/core/router/app_router.dart';
import 'package:auto_care_app/core/theme/app_colors.dart';
import 'package:auto_care_app/core/theme/app_text_styles.dart';
import 'package:auto_care_app/widgets/common/app_button.dart';
import 'package:auto_care_app/widgets/common/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_care_app/features/authentication/presentation/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  void _toggleObscurePassword() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    context.read<AuthBloc>().add(
          AuthLoginRequested(email: email, password: password),
        );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          AppRouter.afterLogin(context, state.user.role);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.statusError,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _HeroHeader(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome Back', style: AppTextStyles.heading1),
                      const SizedBox(height: 8),
                      Text(
                        'Manage your workshop efficiently',
                        style: AppTextStyles.bodySecondary,
                      ),
                      const SizedBox(height: 32),

                      AppTextField(
                        controller: _emailController,
                        hint: 'you@autocare.com',
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),

                      AppTextField(
                        controller: _passwordController,
                        hint: '••••••••',
                        icon: Icons.lock_outline,
                        obscureText: _obscurePassword,
                        trailing: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.textMuted,
                            size: 20,
                          ),
                          onPressed: _toggleObscurePassword,
                        ),
                      ),

                      const SizedBox(height: 24),

                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return AppButton(
                            label: 'Login',
                            icon: Icons.arrow_forward,
                            isLoading: state is AuthLoading,
                            onPressed: _login,
                          );
                        },
                      ),

                      const SizedBox(height: 24),
                      Row(
                        children: [
                          const Expanded(
                              child: Divider(color: AppColors.divider)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            child: Text("OR", style: AppTextStyles.caption),
                          ),
                          const Expanded(
                              child: Divider(color: AppColors.divider)),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              '© 2026 AutoCare Pro',
                              style: AppTextStyles.caption,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Privacy Policy  ·  Terms  ·  System Status',
                              style: AppTextStyles.caption,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroHeader extends StatelessWidget {
  const _HeroHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/garage_hero.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                'https://images.unsplash.com/photo-1632823469850-2f77dd9c7d93?w=800&q=80',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: AppColors.surface),
              );
            },
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.background.withValues(alpha: 0.6),
                  AppColors.background,
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Text(
              'AUTOCARE PRO',
              textAlign: TextAlign.center,
              style: AppTextStyles.heading1.copyWith(
                letterSpacing: 1.2,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.6),
                    blurRadius: 12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
