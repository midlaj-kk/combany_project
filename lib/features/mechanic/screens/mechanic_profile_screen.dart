import 'package:auto_care_app/core/di/injection.dart';
import 'package:auto_care_app/features/advisor/models/service_job_model.dart';
import 'package:auto_care_app/features/advisor/bloc/job_bloc.dart';
import 'package:auto_care_app/widgets/common/role_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../auth/bloc/bloc.dart';
import '../../auth/bloc/event.dart';
import '../../auth/bloc/state.dart';

class MechanicProfileScreen extends StatefulWidget {
  const MechanicProfileScreen({super.key});

  @override
  State<MechanicProfileScreen> createState() => _MechanicProfileScreenState();
}

class _MechanicProfileScreenState extends State<MechanicProfileScreen> {
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      setState(() => _isLoading = false);
    }
    _load();
  }

  void _load() {
    context.read<AuthBloc>().add(const AuthGetCurrentUser());
  }

  void _onStateChanged(BuildContext context, AuthState state) {
    if (state is AuthAuthenticated) {
      setState(() {
        _isLoading = false;
        _errorMessage = null;
      });
    } else if (state is AuthError) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Could not load profile. Pull down to retry.';
      });
    } else if (state is AuthUnauthenticated) {
      if (context.mounted) {
        AppRouter.toLogin(context, replace: true);
      }
    } else if (state is AuthLoading) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
    }
  }

  Future<void> _logout() async {
    if (!mounted) return;
    context.read<AuthBloc>().add(const AuthLogoutRequested());
  }

  static const _completedStatuses = [
    ServiceJobStatus.qcPending,
    ServiceJobStatus.readyForBill,
    ServiceJobStatus.readyForDelivery,
    ServiceJobStatus.delivered,
  ];

  int _countCompletedThisMonth(List<ServiceJobModel> jobs, int? mechanicId) {
    if (mechanicId == null) return 0;
    final now = DateTime.now();
    var count = 0;
    for (final job in jobs) {
      if (job.assignedMechanic != mechanicId) continue;
      if (!_completedStatuses.contains(job.status)) continue;
      // The backend sends UTC time, so convert it to the device timezone
      // before comparing the date.
      final finished = DateTime.tryParse(job.updatedAt ?? '')?.toLocal();
      if (finished == null) continue;
      if (finished.year == now.year && finished.month == now.month) count++;
    }
    return count;
  }

  String? _averageCompletionTime(List<ServiceJobModel> jobs, int? mechanicId) {
    if (mechanicId == null) return null;
    Duration total = Duration.zero;
    var delivered = 0;
    for (final job in jobs) {
      if (job.assignedMechanic != mechanicId) continue;
      if (job.status != ServiceJobStatus.delivered) continue;
      final created = DateTime.tryParse(job.createdAt ?? '');
      final finished = DateTime.tryParse(job.updatedAt ?? '');
      if (created == null || finished == null) continue;
      if (!finished.isAfter(created)) continue;
      total += finished.difference(created);
      delivered++;
    }
    if (delivered == 0) return null;
    final hours = total.inHours;
    final minutes = total.inMinutes % 60;
    return '${hours}h ${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<JobBloc>()..add(const JobsLoadRequested(pageSize: 100)),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: _onStateChanged,
        listenWhen: (_, current) =>
            current is AuthAuthenticated ||
            current is AuthError ||
            current is AuthUnauthenticated,
        builder: (context, state) {
          final user =
              state is AuthAuthenticated ? state.user : null;

          return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: _isLoading
                  ? const Center(
                      child:
                          CircularProgressIndicator(color: AppColors.limeAccent),
                    )
                  : RefreshIndicator(
                      onRefresh: () async => _load(),
                      color: AppColors.limeAccent,
                      backgroundColor: AppColors.surface,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // --- Header ---
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'MECHANIC - PROFILE',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.limeAccent,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: AppColors.cardBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.settings_outlined,
                                      color: AppColors.textPrimary, size: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),

                            if (_errorMessage != null) ...[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text(_errorMessage!,
                                    style: AppTextStyles.bodySecondary),
                              ),
                            ],

                            // --- Avatar + name ---
                            Center(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 96,
                                        height: 96,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: AppColors.limeAccent,
                                              width: 2),
                                        ),
                                        child: const CircleAvatar(
                                          backgroundColor: AppColors.inputFill,
                                          child: Icon(Icons.person,
                                              size: 40,
                                              color: AppColors.textMuted),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 4,
                                        right: 4,
                                        child: Container(
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                            color: AppColors.statusSuccess,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppColors.background,
                                                width: 2),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    user?.name ?? '',
                                    style: AppTextStyles.heading2,
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: AppColors.limeAccent
                                          .withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      (user?.specialization ?? 'MECHANIC')
                                          .toString()
                                          .toUpperCase(),
                                      style: const TextStyle(
                                        color: AppColors.limeAccent,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 28),

                            // --- Live stat cards ---
                            BlocBuilder<JobBloc, JobState>(
                              builder: (context, jobState) {
                                final jobs = jobState is JobsLoaded
                                    ? jobState.jobs.results
                                    : const <ServiceJobModel>[];
                                final authState = context.read<AuthBloc>().state;
                                final mechanicId = authState is AuthAuthenticated
                                    ? authState.user.id
                                    : null;
                                final completedThisMonth =
                                    _countCompletedThisMonth(jobs, mechanicId);
                                final avgTime =
                                    _averageCompletionTime(jobs, mechanicId);

                                return Column(
                                  children: [
                                    _StatRow(
                                      icon: Icons.emoji_events_outlined,
                                      label: 'JOBS COMPLETED THIS MONTH',
                                      value: completedThisMonth.toString(),
                                    ),
                                    const SizedBox(height: 12),
                                    _StatRow(
                                      icon: Icons.access_time,
                                      label: 'AVG. COMPLETION TIME',
                                      value: avgTime ?? 'No data',
                                    ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 24),

                            // --- Settings list ---
                            _SettingsTile(
                              icon: Icons.logout,
                              label: 'Logout',
                              isDestructive: true,
                              onTap: _logout,
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
            bottomNavigationBar:
                const RoleBottomNav(role: 'mechanic', activeIndex: 1),
          );
        },
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.limeAccent, size: 16),
              const SizedBox(width: 8),
              Text(label,
                  style: AppTextStyles.caption.copyWith(letterSpacing: 0.4)),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: AppTextStyles.heading2),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? AppColors.statusError : AppColors.textPrimary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: (isDestructive
                        ? AppColors.statusError
                        : AppColors.limeAccent)
                    .withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(label,
                  style: AppTextStyles.bodyRegular.copyWith(color: color)),
            ),
            Icon(
              isDestructive ? Icons.arrow_forward : Icons.chevron_right,
              color: color,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
