import 'package:auto_care_app/core/router/app_router.dart';
import 'package:auto_care_app/core/theme/app_colors.dart';
import 'package:auto_care_app/core/theme/app_text_styles.dart';
import 'package:auto_care_app/widgets/common/app_button.dart';
import 'package:auto_care_app/widgets/common/app_text_field.dart';
import 'package:flutter/material.dart';

/// Staff login screen. Demo-only: the email decides which dashboard
/// to land on.
///   * email containing "advisor"  -> Service Advisor dashboard
///   * email containing "mechanic" -> Mechanic dashboard
///   * email containing "cashier"  -> Cashier dashboard
///   * anything else               -> Admin dashboard
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;
  bool _isLoading = false;
  String? _errorMessage;

  /// Result role after a successful login, so the UI can navigate.
  String? _loggedInRole;

  void _toggleObscurePassword() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  void _toggleRememberMe(bool value) {
    setState(() => _rememberMe = value);
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() => _errorMessage = 'Please enter both email and password');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await Future<void>.delayed(const Duration(milliseconds: 400));

    final String role;
    final String normalized = email.toLowerCase();
    if (normalized.contains('advisor')) {
      role = 'service_advisor';
    } else if (normalized.contains('mechanic')) {
      role = 'mechanic';
    } else if (normalized.contains('cashier')) {
      role = 'cashier';
    } else {
      role = 'admin';
    }

    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _loggedInRole = role;
    });
  }

  void _onLoginSuccess(String role) {
    setState(() => _loggedInRole = null);
    AppRouter.afterLogin(context, role);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loggedInRole != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) _onLoginSuccess(_loggedInRole!);
      });
    }

    return Scaffold(
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

                    if (_errorMessage != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        _errorMessage!,
                        style: const TextStyle(
                          color: AppColors.statusError,
                          fontSize: 13,
                        ),
                      ),
                    ],

                    const SizedBox(height: 16),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Switch(
                    //           value: _rememberMe,
                    //           activeThumbColor: AppColors.limeAccent,
                    //           onChanged: _toggleRememberMe,
                    //         ),
                    //         Text('Remember me',
                    //             style: AppTextStyles.bodySecondary),
                    //       ],
                    //     ),
                    //     TextButton(
                    //       onPressed: () {
                    //         ScaffoldMessenger.of(context).showSnackBar(
                    //           const SnackBar(
                    //             content: Text(
                    //                 'Password reset is handled by your workshop admin.'),
                    //           ),
                    //         );
                    //       },
                    //       child: const Text(
                    //         'Forgot Password?',
                    //         style: TextStyle(color: AppColors.limeAccent),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 24),

                    AppButton(
                      label: 'Login',
                      icon: Icons.arrow_forward,
                      isLoading: _isLoading,
                      onPressed: _login,
                    ),

                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const Expanded(
                            child: Divider(color: AppColors.divider)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text("OR", style: AppTextStyles.caption),
                        ),
                        const Expanded(
                            child: Divider(color: AppColors.divider)),
                      ],
                    ),
                    const SizedBox(height: 24),

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
    );
  }
}

/// Top hero image with dark gradient fade, matching the Stitch design.
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
