import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/app_button.dart';
import '../../../widgets/common/app_text_field.dart';
import '../data/models/user_model.dart';
import '../domain/repositories/admin_repository.dart';
import '../presentation/bloc/admin_bloc.dart';
import '../widgets/avatar_upload_picker.dart';
import '../widgets/role_selector.dart';

class AddMechanicScreen extends StatefulWidget {
  const AddMechanicScreen({super.key});

  @override
  State<AddMechanicScreen> createState() => _AddMechanicScreenState();
}

class _AddMechanicScreenState extends State<AddMechanicScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _specializationController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _selectedRole = 'mechanic';
  bool _obscurePassword = true;

  bool get _isMechanicRole => _selectedRole == 'mechanic';

  void _setRole(String role) {
    setState(() => _selectedRole = role);
  }

  void _toggleObscurePassword() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  void _generatePassword() {
    const chars =
        'ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789';
    final rand = Random.secure();
    _passwordController.text =
        List.generate(10, (_) => chars[rand.nextInt(chars.length)]).join();
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _specializationController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (_nameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    final role = _selectedRole == 'mechanic'
        ? UserRole.mechanic
        : _selectedRole == 'service_advisor'
            ? UserRole.serviceAdvisor
            : _selectedRole == 'cashier'
                ? UserRole.cashier
                : UserRole.admin;

    context.read<AdminBloc>().add(
          AdminUserCreateRequested(
            request: UserCreateRequest(
              name: _nameController.text.trim(),
              email: _emailController.text.trim(),
              phone: _phoneController.text.trim(),
              role: role,
              password: _passwordController.text,
              specialization:
                  _isMechanicRole ? _specializationController.text.trim() : null,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminBloc(repository: getIt<AdminRepository>()),
      child: Builder(
        builder: (context) {
          return BlocListener<AdminBloc, AdminState>(
            listener: (context, state) {
              if (state is AdminUserCreated) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Staff account created successfully')),
                );
                Navigator.of(context).maybePop();
              } else if (state is AdminError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            child: Scaffold(
              backgroundColor: AppColors.background,
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () =>
                                Navigator.of(context).maybePop(),
                            icon: const Icon(Icons.arrow_back,
                                color: AppColors.textPrimary),
                          ),
                          Expanded(
                            child: Text(
                              'Admin - Add/Edit Mechanic',
                              style: AppTextStyles.heading3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                        child: Column(
                          children: [
                            AvatarUploadPicker(onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Profile photo upload is not available yet.'),
                                ),
                              );
                            }),
                            const SizedBox(height: 28),
                            const _FieldLabel('Full Name'),
                            AppTextField(
                              controller: _nameController,
                              hint: 'e.g. Robert Jensen',
                              icon: Icons.person_outline,
                            ),
                            const SizedBox(height: 16),
                            const _FieldLabel('Email Address'),
                            AppTextField(
                              controller: _emailController,
                              hint: 'r.jensen@autocare.pro',
                              icon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 16),
                            const _FieldLabel('Phone Number'),
                            AppTextField(
                              controller: _phoneController,
                              hint: '+1 (555) 000-0000',
                              icon: Icons.phone_outlined,
                              keyboardType: TextInputType.phone,
                            ),
                            const SizedBox(height: 16),
                            if (_isMechanicRole) ...[
                              const _FieldLabel('Specialization'),
                              AppTextField(
                                controller: _specializationController,
                                hint: 'e.g. Engine & Transmission',
                                icon: Icons.build_outlined,
                              ),
                              const SizedBox(height: 16),
                            ],
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: _FieldLabel('System Role'),
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RoleSelector(
                                selectedRole: _selectedRole,
                                onChanged: _setRole,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Expanded(
                                    child: _FieldLabel('Temporary Password')),
                                TextButton(
                                  onPressed: _generatePassword,
                                  child: const Text('Generate',
                                      style: TextStyle(
                                          color: AppColors.limeAccent)),
                                ),
                              ],
                            ),
                            AppTextField(
                              controller: _passwordController,
                              hint: '\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022',
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
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: AppColors.inputFill,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.info_outline,
                                      color: AppColors.limeAccent, size: 18),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      'Login credentials will be shared with the staff '
                                      'member after creation. They will be prompted to '
                                      'reset their password on first login.',
                                      style: AppTextStyles.caption,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            BlocBuilder<AdminBloc, AdminState>(
                              builder: (context, state) {
                                return AppButton(
                                  label: 'Create Account',
                                  isLoading: state is AdminLoading,
                                  onPressed: () => _submit(context),
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(context).maybePop(),
                              child: Text('Cancel',
                                  style: AppTextStyles.bodySecondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 4),
      child: Text(
        text.toUpperCase(),
        style: AppTextStyles.caption.copyWith(
          color: AppColors.limeAccent,
          letterSpacing: 0.6,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
