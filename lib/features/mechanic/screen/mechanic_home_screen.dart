import 'package:auto_care_app/features/advisor/presentation/bloc/job_bloc.dart';
import 'package:auto_care_app/features/advisor/data/models/service_job_model.dart';
import 'package:auto_care_app/widgets/common/role_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/mechanic_job_card.dart';


class MechanicHomeScreen extends StatefulWidget {
  const MechanicHomeScreen({super.key});

  @override
  State<MechanicHomeScreen> createState() => _MechanicHomeScreenState();
}

class _MechanicHomeScreenState extends State<MechanicHomeScreen> {
  static const _tabs = [
    ('all', 'All'),
    ('waiting', 'Waiting'),
    ('in_progress', 'In Progress'),
    ('rework', 'Rework'),
  ];

  String _selectedFilter = 'all';

  int _assignedCount = 0;
  int _completedTodayCount = 0;
  List<ServiceJobModel> _jobs = [];

  @override
  void initState() {
    super.initState();
    _loadJobs();
  }

  void _loadJobs() {
    context.read<JobBloc>().add(const JobsLoadRequested());
  }

  void _onStateChanged(BuildContext context, JobState state) {
    if (state is JobsLoaded) {
      final allJobs = state.jobs.results;
      final assigned = allJobs
          .where((j) =>
              j.status != ServiceJobStatus.delivered &&
              j.status != ServiceJobStatus.cancelled)
          .length;

      final today = DateTime.now();
      final completedToday = allJobs.where((j) {
        if (j.status != ServiceJobStatus.qcPending &&
            j.status != ServiceJobStatus.readyForBill) {
          return false;
        }
        final updated = DateTime.tryParse(j.updatedAt ?? '');
        return updated != null &&
            updated.year == today.year &&
            updated.month == today.month &&
            updated.day == today.day;
      }).length;

      setState(() {
        _assignedCount = assigned;
        _completedTodayCount = completedToday;
        _jobs = _selectedFilter == 'all'
            ? allJobs
            : _selectedFilter == 'rework'
                ? allJobs
                    .where(
                        (j) => j.status == ServiceJobStatus.reworkRequired)
                    .toList()
                : allJobs
                    .where(
                        (j) => j.status?.name == _selectedFilter)
                    .toList();
      });
    } else if (state is JobError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not load your jobs. Pull down to retry.'),
          backgroundColor: AppColors.statusError,
        ),
      );
    }
  }

  void _setFilter(String filter) {
    setState(() => _selectedFilter = filter);
    _loadJobs();
  }

  String _timeAgo(String? isoDate) {
    if (isoDate == null) return '';
    final date = DateTime.tryParse(isoDate);
    if (date == null) return '';
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ${diff.inMinutes % 60}m ago';
    return '${diff.inDays}d ago';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobBloc, JobState>(
      listener: _onStateChanged,
      listenWhen: (_, current) => current is JobsLoaded || current is JobError,
      builder: (context, state) {
        final isLoading = state is JobLoading && _jobs.isEmpty;

        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async => _loadJobs(),
              color: AppColors.limeAccent,
              backgroundColor: AppColors.surface,
              child: SingleChildScrollView(
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
                          child: Icon(Icons.person, color: AppColors.textMuted),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mechanic - Home', style: AppTextStyles.heading3),
                              Text('ENGINE & TRANSMISSION',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.limeAccent,
                                    letterSpacing: 0.6,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: AppColors.cardBackground,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.notifications_outlined,
                              color: AppColors.textPrimary, size: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // --- Stat cards ---
                    Row(
                      children: [
                        Expanded(
                          child: _StatCard(
                            label: 'ASSIGNED TO ME',
                            value: _assignedCount.toString().padLeft(2, '0'),
                            icon: Icons.build_outlined,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatCard(
                            label: 'COMPLETED TODAY',
                            value:
                                _completedTodayCount.toString().padLeft(2, '0'),
                            icon: Icons.check_circle_outline,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // --- Filter tabs ---
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _tabs.length,
                        separatorBuilder: (_, _) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final (value, label) = _tabs[index];
                          final isSelected = value == _selectedFilter;
                          return ChoiceChip(
                            label: Text(label),
                            selected: isSelected,
                            onSelected: (_) => _setFilter(value),
                            backgroundColor: AppColors.cardBackground,
                            selectedColor: AppColors.limeAccent,
                            labelStyle: TextStyle(
                              color: isSelected
                                  ? Colors.black
                                  : AppColors.textSecondary,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide.none,
                            ),
                            showCheckmark: false,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    Text('ACTIVE JOBS',
                        style: AppTextStyles.caption.copyWith(letterSpacing: 0.8)),
                    const SizedBox(height: 10),

                    if (isLoading)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Center(
                          child: CircularProgressIndicator(
                              color: AppColors.limeAccent),
                        ),
                      )
                    else if (_jobs.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Center(
                          child: Text('No jobs found',
                              style: AppTextStyles.bodySecondary),
                        ),
                      )
                    else
                      ..._jobs.map((job) {
                        return MechanicJobCard(
                          jobNumber: job.jobNumber,
                          vehicleInfo: job.vehicleNumber ?? '',
                          vehicleModel: job.serviceType,
                          complaint: job.complaint,
                          status: job.status?.name ?? 'waiting',
                          timeAgo: _timeAgo(job.createdAt),
                          onTap: () => AppRouter.toJobDetailMechanic(
                            context,
                            jobId: job.id,
                          ),
                        );
                      }),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: const RoleBottomNav(role: 'mechanic'),
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: AppTextStyles.caption.copyWith(letterSpacing: 0.4)),
                const SizedBox(height: 6),
                Text(value,
                    style: AppTextStyles.heading1.copyWith(fontSize: 26)),
              ],
            ),
          ),
          Icon(icon, color: AppColors.limeAccent, size: 22),
        ],
      ),
    );
  }
}
