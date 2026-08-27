import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/job_card.dart';
import '../../../widgets/common/role_bottom_nav.dart';
import '../../../widgets/common/stat_card.dart';
import '../../advisor/models/service_job_model.dart';
import '../../advisor/services/advisor_service.dart';
import '../../advisor/bloc/job_bloc.dart';
import '../services/admin_service.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';
import '../widgets/low_stock_banner.dart';
import '../widgets/quick_action_button.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() =>
      _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen>
    with RouteAware {
  late final AdminBloc _adminBloc;

  @override
  void initState() {
    super.initState();
    _adminBloc = AdminBloc(service: getIt<AdminService>())
      ..add(const AdminDashboardSummaryRequested());
  }

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
    _adminBloc.close();
    super.dispose();
  }

  /// Reload fresh dashboard data whenever this screen becomes visible again
  /// (i.e. after returning from a pushed screen like Quality Check), so the
  /// Active Jobs, Pending QC and Recent Jobs reflect the latest state.
  @override
  void didPopNext() {
    if (!mounted) return;
    _adminBloc.add(const AdminDashboardSummaryRequested());
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AdminBloc>.value(value: _adminBloc),
        BlocProvider(
          create: (_) => JobBloc(service: getIt<AdvisorService>()),
        ),
      ],
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                context
                    .read<AdminBloc>()
                    .add(const AdminDashboardSummaryRequested());
              },
              color: AppColors.limeAccent,
              backgroundColor: AppColors.surface,
              child: MultiBlocListener(
                listeners: [
                  BlocListener<JobBloc, JobState>(
                    listener: (context, state) {
                      if (state is JobsLoaded) {
                        final jobs = state.jobs.results;
                        if (jobs.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'No jobs pending quality check')),
                          );
                        } else {
                          _showQcPicker(context, jobs);
                        }
                      } else if (state is JobError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'No jobs pending quality check')),
                        );
                      }
                    },
                  ),
                ],
                child: BlocBuilder<AdminBloc, AdminState>(
                  builder: (context, state) {
                    if (state is AdminLoading ||
                        state is AdminInitial) {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.limeAccent),
                      );
                    }

                    if (state is AdminError) {
                      return _ErrorState(message: state.message);
                    }

                    if (state is AdminDashboardLoaded) {
                      final summary = state.summary;
                      final activeJobs =
                          summary['active_jobs'] ?? 0;
                      final pendingQc =
                          summary['pending_qc'] ?? 0;
                      final lowStockItems =
                          summary['low_stock_items'] ?? 0;
                      final recentJobs =
                          (summary['recent_jobs']
                                  as List<dynamic>?) ??
                              [];

                      return SingleChildScrollView(
                        physics:
                            const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 22,
                                  backgroundColor:
                                      AppColors.inputFill,
                                  child: Icon(Icons.person,
                                      color:
                                          AppColors.textMuted),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Admin - Dashboard',
                                          style: AppTextStyles
                                              .heading3),
                                      Text(
                                          'WORKSHOP OVERVIEW',
                                          style: AppTextStyles
                                              .caption
                                              .copyWith(
                                                  letterSpacing:
                                                      1)),
                                    ],
                                  ),
                                ),
                                Stack(
                                  children: [
                                    const Icon(
                                        Icons
                                            .notifications_outlined,
                                        color: AppColors
                                            .textPrimary),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration:
                                            const BoxDecoration(
                                          color: AppColors
                                              .statusError,
                                          shape:
                                              BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: StatCard(
                                    icon: Icons
                                        .directions_car_filled,
                                    value: activeJobs
                                        .toString(),
                                    label:
                                        'Jobs In-Progress',
                                    accentColor: AppColors
                                        .limeAccent,
                                    badgeText: 'ACTIVE',
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: StatCard(
                                    icon: Icons
                                        .shield_outlined,
                                    value: pendingQc
                                        .toString()
                                        .padLeft(2, '0'),
                                    label:
                                        'Pending Check',
                                    accentColor: AppColors
                                        .amberAccent,
                                    badgeText: 'QC',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            if (lowStockItems > 0) ...[
                              LowStockBanner(
                                itemCount: lowStockItems,
                                onTap: () =>
                                    AppRouter.toInventory(
                                        context),
                              ),
                              const SizedBox(height: 24),
                            ],
                            Text('QUICK ACTIONS',
                                style: AppTextStyles.caption
                                    .copyWith(
                                        letterSpacing: 1)),
                            const SizedBox(height: 12),
                            GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics:
                                  const NeverScrollableScrollPhysics(),
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 1.3,
                              children: [
                                QuickActionButton(
                                  icon: Icons
                                      .person_add_alt_1_outlined,
                                  label: 'ADD MECHANIC',
                                  onTap: () => AppRouter
                                      .toAddMechanic(
                                          context),
                                ),
                                QuickActionButton(
                                  icon: Icons
                                      .inventory_2_outlined,
                                  label: 'INVENTORY',
                                  onTap: () => AppRouter
                                      .toInventory(context),
                                ),
                                QuickActionButton(
                                  icon: Icons
                                      .bar_chart_outlined,
                                  label: 'REPORTS',
                                  onTap: () => AppRouter
                                      .toReports(context),
                                ),
                                QuickActionButton(
                                  icon: Icons
                                      .fact_check_outlined,
                                  label: 'QUALITY CHECK',
                                  onTap: () =>
                                      _openQualityCheckPicker(
                                          context),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Text('RECENT JOBS',
                                style: AppTextStyles.caption
                                    .copyWith(
                                        letterSpacing: 1)),
                            const SizedBox(height: 4),
                            if (recentJobs.isEmpty)
                              Padding(
                                padding: const EdgeInsets
                                    .symmetric(vertical: 24),
                                child: Center(
                                  child: Text(
                                      'No recent jobs yet',
                                      style: AppTextStyles
                                          .bodySecondary),
                                ),
                              )
                            else
                              ...recentJobs.map((job) {
                                return JobCard(
                                  jobNumber:
                                      job['job_number'] ?? '',
                                  vehicleInfo:
                                      '${job['vehicle_number'] ?? ''}',
                                  customerName:
                                      job['customer_name'] ??
                                          '',
                                  status:
                                      job['status'] ??
                                          'waiting',
                                  onTap: () =>
                                      AppRouter.toQualityCheck(
                                    context,
                                    serviceJobId:
                                        job['id'],
                                  ),
                                );
                              }),
                          ],
                        ),
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.limeAccent),
                    );
                  },
                ),
              ),
            ),
          ),
          bottomNavigationBar:
              const RoleBottomNav(role: 'admin'),
        ),
      ),
    );
  }

  void _openQualityCheckPicker(BuildContext context) {
    context
        .read<JobBloc>()
        .add(const JobsLoadRequested(status: 'qc_pending'));
  }

  void _showQcPicker(
      BuildContext context, List<ServiceJobModel> jobs) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('PENDING QUALITY CHECK',
                  style: AppTextStyles.caption
                      .copyWith(letterSpacing: 1)),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: jobs.length,
                itemBuilder: (_, index) {
                  final job = jobs[index];
                  return ListTile(
                    title: Text(
                      job.jobNumber,
                      style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      '${job.vehicleNumber ?? ''}  \u00B7  '
                      '${job.customerName ?? ''}',
                      style: const TextStyle(
                          color:
                              AppColors.textSecondary),
                    ),
                    onTap: () {
                      Navigator.of(sheetContext).pop();
                      AppRouter.toQualityCheck(
                        context,
                        serviceJobId: job.id,
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
            const Icon(Icons.cloud_off,
                color: AppColors.textMuted, size: 40),
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
