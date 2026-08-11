import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:flutter/material.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/role_filter_tabs.dart';
import '../widgets/staff_card.dart';

/// Admin "Staff Management" screen — list, search, and filter staff
/// by role, with a floating button to add new staff.
/// Reads static demo data directly from [DemoRepository].
class StaffManagementScreen extends StatefulWidget {
  const StaffManagementScreen({super.key});

  @override
  State<StaffManagementScreen> createState() => _StaffManagementScreenState();
}

class _StaffManagementScreenState extends State<StaffManagementScreen> {
  final TextEditingController _searchController = TextEditingController();

  bool _isLoading = true;
  String? _errorMessage;
  String _selectedRole = 'all';
  List<dynamic> _staffList = [];

  @override
  void initState() {
    super.initState();
    _loadStaff();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadStaff() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final staff = await DemoRepository.instance.getStaff(
        search: _searchController.text.trim(),
        role: _selectedRole,
      );
      if (!mounted) return;
      setState(() => _staffList = staff);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not load staff list. Pull down to retry.';
      });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _onRoleSelected(String role) {
    setState(() => _selectedRole = role);
    _loadStaff();
  }

  void _onSearchSubmitted(String _) {
    _loadStaff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // --- Header ---
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

            // --- Role filter tabs ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoleFilterTabs(
                selectedRole: _selectedRole,
                onRoleSelected: _onRoleSelected,
              ),
            ),
            const SizedBox(height: 16),

            // --- Search bar ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: AppColors.textPrimary),
                onSubmitted: _onSearchSubmitted,
                decoration: const InputDecoration(
                  hintText: 'Search by name or email',
                  prefixIcon: Icon(Icons.search, color: AppColors.textMuted),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // --- Staff list ---
            Expanded(
              child: RefreshIndicator(
                onRefresh: _loadStaff,
                color: AppColors.limeAccent,
                backgroundColor: AppColors.surface,
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.limeAccent),
                      )
                    : _errorMessage != null
                        ? _ErrorState(message: _errorMessage!)
                        : _staffList.isEmpty
                            ? ListView(
                                physics:
                                    const AlwaysScrollableScrollPhysics(),
                                children: [
                                  const SizedBox(height: 80),
                                  Center(
                                    child: Text('No staff found',
                                        style: AppTextStyles.bodySecondary),
                                  ),
                                ],
                              )
                            : ListView.builder(
                                physics:
                                    const AlwaysScrollableScrollPhysics(),
                                padding: const EdgeInsets.fromLTRB(
                                    20, 0, 20, 100),
                                itemCount: _staffList.length,
                                itemBuilder: (context, index) {
                                  final staff = _staffList[index];
                                  return StaffCard(
                                    name: staff['name'] ?? '',
                                    role: staff['role'] ?? '',
                                    email: staff['email'] ?? '',
                                    phone: staff['phone'] ?? '',
                                    isActive: staff['status'] == 'active',
                                  );
                                },
                              ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => AppRouter.toAddMechanic(context),
        backgroundColor: AppColors.limeAccent,
        label: const Text(
          'Add New Staff',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.add, color: Colors.black),
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
