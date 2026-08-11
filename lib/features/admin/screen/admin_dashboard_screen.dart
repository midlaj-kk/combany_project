import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:auto_care_app/core/router/app_router.dart';
import 'package:auto_care_app/widgets/common/job_card.dart';
import 'package:auto_care_app/widgets/common/role_bottom_nav.dart';
import 'package:auto_care_app/widgets/common/stat_card.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/low_stock_banner.dart';
import '../widgets/quick_action_button.dart';

/// Admin home screen — matches the Stitch "Admin Dashboard Home" design.
/// Reads static demo data directly from [DemoRepository].
class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  bool _isLoading = true;
  String? _errorMessage;

  int _activeJobs = 0;
  int _pendingQc = 0;
  int _lowStockItems = 0;
  List<dynamic> _recentJobs = [];

  @override
  void initState() {
    super.initState();
    _loadDashboard();
  }

  Future<void> _loadDashboard() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final summary =
          await DemoRepository.instance.getDashboardSummary();
      final jobs = await DemoRepository.instance.getRecentJobs(limit: 3);

      if (!mounted) return;
      setState(() {
        _activeJobs = summary['active_jobs'] ?? 0;
        _pendingQc = summary['pending_qc'] ?? 0;
        _lowStockItems = summary['low_stock_items'] ?? 0;
        _recentJobs = jobs;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not load dashboard. Pull down to retry.';
      });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  /// Fetches jobs awaiting quality check, used by the Quality Check
  /// quick action. Returns an empty list on failure so the caller can
  /// show a friendly message instead of crashing.
  Future<List<dynamic>> _loadQcPendingJobs() async {
    try {
      return await DemoRepository.instance.getJobs(status: 'qc_pending');
    } catch (_) {
      return [];
    }
  }

  /// Quick-action tap: list QC-pending jobs and let the admin pick one.
  Future<void> _openQualityCheckPicker(BuildContext context) async {
    final jobs = await _loadQcPendingJobs();
    if (!context.mounted) return;

    if (jobs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No jobs pending quality check')),
      );
      return;
    }

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('PENDING QUALITY CHECK',
                  style: AppTextStyles.caption.copyWith(letterSpacing: 1)),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: jobs.length,
                itemBuilder: (_, index) {
                  final job = jobs[index];
                  return ListTile(
                    title: Text(
                      '${job['job_number'] ?? ''}',
                      style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      '${job['vehicle_number'] ?? ''}  ·  '
                      '${job['customer_name'] ?? ''}',
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                    onTap: () {
                      Navigator.of(sheetContext).pop();
                      AppRouter.toQualityCheck(
                        context,
                        serviceJobId: job['id'],
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadDashboard,
          color: AppColors.limeAccent,
          backgroundColor: AppColors.surface,
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.limeAccent),
                )
              : _errorMessage != null
                  ? _ErrorState(message: _errorMessage!)
                  : SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // --- Top bar ---
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 22,
                                backgroundColor: AppColors.inputFill,
                                child: Icon(Icons.person,
                                    color: AppColors.textMuted),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Admin - Dashboard',
                                        style: AppTextStyles.heading3),
                                    Text('WORKSHOP OVERVIEW',
                                        style: AppTextStyles.caption.copyWith(
                                          letterSpacing: 1,
                                        )),
                                  ],
                                ),
                              ),
                              Stack(
                                children: [
                                  const Icon(Icons.notifications_outlined,
                                      color: AppColors.textPrimary),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                        color: AppColors.statusError,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // --- Stat cards row ---
                          Row(
                            children: [
                              Expanded(
                                child: StatCard(
                                  icon: Icons.directions_car_filled,
                                  value: _activeJobs.toString(),
                                  label: 'Jobs In-Progress',
                                  accentColor: AppColors.limeAccent,
                                  badgeText: 'ACTIVE',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: StatCard(
                                  icon: Icons.shield_outlined,
                                  value:
                                      _pendingQc.toString().padLeft(2, '0'),
                                  label: 'Pending Check',
                                  accentColor: AppColors.amberAccent,
                                  badgeText: 'QC',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // --- Low stock banner (conditional) ---
                          if (_lowStockItems > 0) ...[
                            LowStockBanner(
                              itemCount: _lowStockItems,
                              onTap: () => AppRouter.toInventory(context),
                            ),
                            const SizedBox(height: 24),
                          ],

                          // --- Quick actions ---
                          Text('QUICK ACTIONS',
                              style: AppTextStyles.caption
                                  .copyWith(letterSpacing: 1)),
                          const SizedBox(height: 12),
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1.3,
                            children: [
                              QuickActionButton(
                                icon: Icons.person_add_alt_1_outlined,
                                label: 'ADD MECHANIC',
                                onTap: () => AppRouter.toAddMechanic(context),
                              ),
                              QuickActionButton(
                                icon: Icons.inventory_2_outlined,
                                label: 'INVENTORY',
                                onTap: () => AppRouter.toInventory(context),
                              ),
                              QuickActionButton(
                                icon: Icons.bar_chart_outlined,
                                label: 'REPORTS',
                                onTap: () => AppRouter.toReports(context),
                              ),
                              QuickActionButton(
                                icon: Icons.fact_check_outlined,
                                label: 'QUALITY CHECK',
                                onTap: () => _openQualityCheckPicker(context),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // --- Recent jobs ---
                          Text('RECENT JOBS',
                              style: AppTextStyles.caption
                                  .copyWith(letterSpacing: 1)),
                          const SizedBox(height: 4),

                          if (_recentJobs.isEmpty)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 24),
                              child: Center(
                                child: Text('No recent jobs yet',
                                    style: AppTextStyles.bodySecondary),
                              ),
                            )
                          else
                            ..._recentJobs.map((job) {
                              return JobCard(
                                jobNumber: job['job_number'] ?? '',
                                vehicleInfo:
                                    '${job['vehicle_number'] ?? ''}',
                                customerName: job['customer_name'] ?? '',
                                status: job['status'] ?? 'waiting',
                                onTap: () => AppRouter.toQualityCheck(
                                  context,
                                  serviceJobId: job['id'],
                                ),
                              );
                            }),
                        ],
                      ),
                    ),
        ),
      ),
      bottomNavigationBar: const RoleBottomNav(role: 'admin'),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off, color: AppColors.textMuted, size: 40),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySecondary,
            ),
          ],
        ),
      ),
    );
  }
}
