import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:auto_care_app/widgets/common/role_bottom_nav.dart';
import 'package:flutter/material.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/advisor_job_card.dart';
import '../widgets/mini_stat_pill.dart';

/// Service Advisor home screen — matches the Stitch "Service Advisor
/// Home" design. Reads static demo data directly from [DemoRepository].
class AdvisorHomeScreen extends StatefulWidget {
  const AdvisorHomeScreen({super.key});

  @override
  State<AdvisorHomeScreen> createState() => _AdvisorHomeScreenState();
}

class _AdvisorHomeScreenState extends State<AdvisorHomeScreen> {
  static const _tabs = [
    ('all', 'All'),
    ('waiting', 'Waiting'),
    ('in_progress', 'In Progress'),
    ('qc_pending', 'QC Pending'),
  ];

  bool _isLoading = true;
  String? _errorMessage;
  String _selectedFilter = 'all'; // all | waiting | in_progress | qc_pending

  int _waitingCount = 0;
  int _inProgressCount = 0;
  int _qcPendingCount = 0;
  List<dynamic> _jobs = [];

  @override
  void initState() {
    super.initState();
    _loadJobs();
  }

  Future<void> _loadJobs() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Fetch all jobs once to compute the stat counts, then apply
      // the selected tab filter for the displayed list.
      final allJobs = await DemoRepository.instance.getJobs();
      final waiting =
          allJobs.where((j) => j['status'] == 'waiting').length;
      final inProgress =
          allJobs.where((j) => j['status'] == 'in_progress').length;
      final qcPending =
          allJobs.where((j) => j['status'] == 'qc_pending').length;

      if (!mounted) return;
      setState(() {
        _waitingCount = waiting;
        _inProgressCount = inProgress;
        _qcPendingCount = qcPending;
        _jobs = _selectedFilter == 'all'
            ? allJobs
            : allJobs.where((j) => j['status'] == _selectedFilter).toList();
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not load jobs. Pull down to retry.';
      });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _setFilter(String filter) {
    setState(() => _selectedFilter = filter);
    _loadJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadJobs,
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
                        value: _waitingCount.toString(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MiniStatPill(
                        label: 'In Progress',
                        value: _inProgressCount.toString(),
                        isHighlighted: true,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MiniStatPill(
                        label: 'QC Pending',
                        value: _qcPendingCount.toString(),
                        valueColor: AppColors.amberAccent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // --- Today's Jobs header ---
                Text("Today's Jobs", style: AppTextStyles.heading3),
                const SizedBox(height: 4),

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
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: CircularProgressIndicator(
                          color: AppColors.limeAccent),
                    ),
                  )
                else if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(_errorMessage!,
                        style: AppTextStyles.bodySecondary),
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
                    return AdvisorJobCard(
                      jobNumber: job['job_number'] ?? '',
                      vehicleInfo: job['vehicle_number'] ?? '',
                      customerName: job['customer_name'] ?? '',
                      status: job['status'] ?? 'waiting',
                      mechanicName: job['mechanic_name'],
                      onTap: () => AppRouter.toJobDetailAdvisor(
                        context,
                        jobId: job['id'],
                      ),
                    );
                  }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const RoleBottomNav(role: 'advisor'),
    );
  }
}
