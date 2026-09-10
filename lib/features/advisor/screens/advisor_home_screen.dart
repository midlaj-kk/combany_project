import 'package:auto_care_app/features/advisor/bloc/job_bloc.dart';
import 'package:auto_care_app/widgets/common/role_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../models/service_job_model.dart';
import '../widgets/advisor_job_card.dart';
import '../widgets/mini_stat_pill.dart';


class AdvisorHomeScreen extends StatefulWidget {
  const AdvisorHomeScreen({super.key});

  @override
  State<AdvisorHomeScreen> createState() => _AdvisorHomeScreenState();
}

class _AdvisorHomeScreenState extends State<AdvisorHomeScreen>
    with RouteAware {
  static const _tabs = [
    ('all', 'All'),
    ('waiting', 'Waiting'),
    ('in_progress', 'In Progress'),
    ('qc_pending', 'QC Pending'),
  ];

  String _selectedFilter = 'all';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      AppRouter.routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    AppRouter.routeObserver.unsubscribe(this);
    super.dispose();
  }

  /// Reload the job list whenever this screen becomes visible again (i.e.
  /// after returning from a pushed screen like Customer List or Job Detail),
  /// so newly created or updated jobs show up in "Today's Jobs".
  @override
  void didPopNext() {
    if (!mounted) return;
    context.read<JobBloc>().add(const JobsLoadRequested(pageSize: 100));
    super.didPopNext();
  }

  void _setFilter(String filter) {
    setState(() => _selectedFilter = filter);
  }

  String _statusString(ServiceJobStatus? status) => switch (status) {
    ServiceJobStatus.waiting => 'waiting',
    ServiceJobStatus.inProgress => 'in_progress',
    ServiceJobStatus.waitingForParts => 'waiting_for_parts',
    ServiceJobStatus.qcPending => 'qc_pending',
    ServiceJobStatus.reworkRequired => 'rework_required',
    ServiceJobStatus.readyForBill => 'ready_for_bill',
    ServiceJobStatus.readyForDelivery => 'ready_for_delivery',
    ServiceJobStatus.delivered => 'delivered',
    ServiceJobStatus.cancelled => 'cancelled',
    null => '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<JobBloc, JobState>(
          builder: (context, state) {
            final isLoading = state is JobLoading;
            final errorMessage = state is JobError ? state.message : null;
            final allJobs = state is JobsLoaded ? state.jobs.results : <ServiceJobModel>[];

            final waitingCount =
                allJobs.where((j) => j.status == ServiceJobStatus.waiting).length;
            final inProgressCount =
                allJobs.where((j) => j.status == ServiceJobStatus.inProgress).length;
            final qcPendingCount =
                allJobs.where((j) => j.status == ServiceJobStatus.qcPending).length;

            final filteredJobs = _selectedFilter == 'all'
                ? allJobs
                : allJobs
                    .where((j) => _statusString(j.status) == _selectedFilter)
                    .toList();

            return RefreshIndicator(
              onRefresh: () async {
                if (!mounted) return;
                context.read<JobBloc>().add(const JobsLoadRequested(pageSize: 100));
              },
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
                              Text('Advisor - Home', style: AppTextStyles.heading3),
                              Text('FRONT DESK',
                                  style: AppTextStyles.caption
                                      .copyWith(letterSpacing: 1)),
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

                    // --- New Service Job CTA ---
                    InkWell(
                      onTap: () => AppRouter.toCustomerList(context),
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.limeAccent,
                              AppColors.limeAccent.withValues(alpha: 0.7),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.add,
                                  color: Colors.black, size: 22),
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              'New Service Job',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Register a customer & create a job',
                              style: TextStyle(
                                color: Colors.black.withValues(alpha: 0.65),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // --- Stat pills ---
                    Row(
                      children: [
                        Expanded(
                          child: MiniStatPill(
                            label: 'Waiting',
                            value: waitingCount.toString(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: MiniStatPill(
                            label: 'In Progress',
                            value: inProgressCount.toString(),
                            isHighlighted: true,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: MiniStatPill(
                            label: 'QC Pending',
                            value: qcPendingCount.toString(),
                            valueColor: AppColors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // --- Today's Jobs header ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today's Jobs", style: AppTextStyles.heading3),
                        Text('${allJobs.length} jobs',
                            style: AppTextStyles.caption),
                      ],
                    ),
                    const SizedBox(height: 12),

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
                    const SizedBox(height: 16),

                    // --- Job list ---
                    if (isLoading)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Center(
                          child: CircularProgressIndicator(
                              color: AppColors.limeAccent),
                        ),
                      )
                    else if (errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Text(errorMessage,
                            style: AppTextStyles.bodySecondary),
                      )
                    else if (filteredJobs.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Center(
                          child: Text('No jobs found',
                              style: AppTextStyles.bodySecondary),
                        ),
                      )
                    else
                      ...filteredJobs.map((job) {
                        return AdvisorJobCard(
                          jobNumber: job.jobNumber,
                          vehicleInfo: job.vehicleNumber ?? '',
                          customerName: job.customerName ?? '',
                          status: _statusString(job.status),
                          mechanicName: job.mechanicName,
                          onTap: () => AppRouter.toJobDetailAdvisor(
                            context,
                            jobId: job.id,
                          ),
                        );
                      }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const RoleBottomNav(role: 'advisor'),
    );
  }
}
