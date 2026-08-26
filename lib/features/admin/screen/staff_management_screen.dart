import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../data/models/user_model.dart';
import '../domain/repositories/admin_repository.dart';
import '../presentation/bloc/admin_bloc.dart';
import '../widgets/role_filter_tabs.dart';
import '../widgets/staff_card.dart';

class StaffManagementScreen extends StatefulWidget {
  const StaffManagementScreen({super.key});

  @override
  State<StaffManagementScreen> createState() => _StaffManagementScreenState();
}

class _StaffManagementScreenState extends State<StaffManagementScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedRole = 'all';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _roleFilterValue(UserRole role) {
    switch (role) {
      case UserRole.admin:
        return 'admin';
      case UserRole.serviceAdvisor:
        return 'service_advisor';
      case UserRole.mechanic:
        return 'mechanic';
      case UserRole.cashier:
        return 'cashier';
    }
  }

  List<UserModel> _filterByRole(List<UserModel> users) {
    if (_selectedRole == 'all') return users;
    return users
        .where((u) => _roleFilterValue(u.role) == _selectedRole)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminBloc(repository: getIt<AdminRepository>())
        ..add(AdminUsersLoadRequested(
            search: _searchController.text.trim().isNotEmpty
                ? _searchController.text.trim()
                : null)),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).maybePop(),
                          icon: const Icon(Icons.arrow_back,
                              color: AppColors.textPrimary),
                        ),
                        Expanded(
                          child: Text(
                            'Admin - Staff Management',
                            style: AppTextStyles.heading3,
                          ),
                        ),
                        IconButton(
                          onPressed: () => AppRouter.toAddMechanic(context),
                          icon: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: AppColors.limeAccent,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.add,
                                color: Colors.black, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RoleFilterTabs(
                      selectedRole: _selectedRole,
                      onRoleSelected: (role) {
                        setState(() => _selectedRole = role);
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _searchController,
                      style:
                          const TextStyle(color: AppColors.textPrimary),
                      onSubmitted: (_) {
                        context.read<AdminBloc>().add(
                              AdminUsersLoadRequested(
                                search:
                                    _searchController.text.trim().isNotEmpty
                                        ? _searchController.text.trim()
                                        : null,
                              ),
                            );
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search by name or email',
                        prefixIcon:
                            Icon(Icons.search, color: AppColors.textMuted),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<AdminBloc>().add(
                              AdminUsersLoadRequested(
                                search:
                                    _searchController.text.trim().isNotEmpty
                                        ? _searchController.text.trim()
                                        : null,
                              ),
                            );
                      },
                      color: AppColors.limeAccent,
                      backgroundColor: AppColors.surface,
                      child: BlocBuilder<AdminBloc, AdminState>(
                        builder: (context, state) {
                          if (state is AdminLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.limeAccent),
                            );
                          }
                          if (state is AdminError) {
                            return _ErrorState(message: state.message);
                          }
                          if (state is AdminUsersLoaded) {
                            final filtered =
                                _filterByRole(state.users.results);
                            if (filtered.isEmpty) {
                              return ListView(
                                physics:
                                    const AlwaysScrollableScrollPhysics(),
                                children: [
                                  const SizedBox(height: 80),
                                  Center(
                                    child: Text('No staff found',
                                        style:
                                            AppTextStyles.bodySecondary),
                                  ),
                                ],
                              );
                            }
                            return ListView.builder(
                              physics:
                                  const AlwaysScrollableScrollPhysics(),
                              padding: const EdgeInsets.fromLTRB(
                                  20, 0, 20, 100),
                              itemCount: filtered.length,
                              itemBuilder: (context, index) {
                                final staff = filtered[index];
                                return StaffCard(
                                  name: staff.name,
                                  role: staff.role.name,
                                  email: staff.email,
                                  phone: staff.phone,
                                  isActive: staff.isActive ?? true,
                                );
                              },
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => AppRouter.toAddMechanic(context),
              backgroundColor: AppColors.limeAccent,
              label: const Text(
                'Add New Staff',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              icon: const Icon(Icons.add, color: Colors.black),
            ),
          );
        },
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 100),
        Icon(Icons.cloud_off, color: AppColors.textMuted, size: 40)
            .withCenter(),
        const SizedBox(height: 12),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySecondary,
            ),
          ),
        ),
      ],
    );
  }
}

extension on Widget {
  Widget withCenter() => Center(child: this);
}
