import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:flutter/material.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/report_card.dart';

/// Admin "Reports" dashboard screen.
class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  bool _isLoading = true;
  String? _errorMessage;

  double _revenueThisMonth = 0;
  int _completedServices = 0;
  String _topMechanicName = '';
  int _topMechanicJobs = 0;
  String _mostUsedPartName = '';
  double _pendingPaymentsTotal = 0;
  int _lowStockCount = 0;

  @override
  void initState() {
    super.initState();
    _loadReports();
  }

  Future<void> _loadReports() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final now = DateTime.now();
      final monthStart =
          '${now.year}-${now.month.toString().padLeft(2, '0')}-01';
      final today =
          '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

      final revenue = await DemoRepository.instance
          .getMonthlyRevenue(now.month, now.year);
      final completed = await DemoRepository.instance
          .getCompletedServices(monthStart, today);
      final productivity = await DemoRepository.instance
          .getMechanicProductivity(monthStart, today);
      final partsUsage = await DemoRepository.instance
          .getSparePartsUsage(monthStart, today);
      final pending = await DemoRepository.instance
          .getPendingPaymentsReport();
      final lowStock = await DemoRepository.instance
          .getSpareParts(lowStockOnly: true);

      final mechanics =
          productivity['mechanics'] as List<dynamic>? ?? [];
      final parts = partsUsage['parts'] as List<dynamic>? ?? [];

      if (!mounted) return;
      setState(() {
        _revenueThisMonth = (revenue['total_revenue'] as num?)?.toDouble() ?? 0;
        _completedServices = completed['total_completed'] ?? 0;
        if (mechanics.isNotEmpty) {
          _topMechanicName = mechanics.first['mechanic_name'] ?? '';
          _topMechanicJobs = mechanics.first['completed_jobs'] ?? 0;
        }
        if (parts.isNotEmpty) {
          _mostUsedPartName = parts.first['part_name'] ?? '';
        }
        _pendingPaymentsTotal = pending.fold<double>(
          0,
          (sum, bill) =>
              sum + ((bill['total_amount'] as num?)?.toDouble() ?? 0),
        );
        _lowStockCount = lowStock.length;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not load reports. Pull down to retry.';
      });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.limeAccent),
              )
            : RefreshIndicator(
                onRefresh: _loadReports,
                color: AppColors.limeAccent,
                backgroundColor: AppColors.surface,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Header ---
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.of(context).maybePop(),
                            icon: const Icon(Icons.arrow_back,
                                color: AppColors.textPrimary),
                          ),
                          Expanded(
                            child: Text('Admin - Reports',
                                style: AppTextStyles.heading3),
                          ),
                          const Icon(Icons.calendar_today_outlined,
                              color: AppColors.textPrimary, size: 20),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // --- Date range chip ---
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('This Month',
                                style: AppTextStyles.bodySecondary),
                            const SizedBox(width: 4),
                            const Icon(Icons.keyboard_arrow_down,
                                color: AppColors.textMuted, size: 18),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      Text(
                        'BUSINESS HEALTH',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.limeAccent,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('Operational Overview',
                          style: AppTextStyles.heading1.copyWith(fontSize: 26)),
                      const SizedBox(height: 20),

                      if (_errorMessage != null) ...[
                        Text(_errorMessage!,
                            style: const TextStyle(
                                color: AppColors.statusError, fontSize: 13)),
                        const SizedBox(height: 12),
                      ],

                      ReportCard(
                        icon: Icons.show_chart,
                        iconColor: AppColors.statusSuccess,
                        title: 'Revenue Report',
                        value:
                            '₹${_revenueThisMonth.toStringAsFixed(0)}',
                        subtitle: 'this month',
                      ),
                      ReportCard(
                        icon: Icons.verified_outlined,
                        iconColor: AppColors.statusSuccess,
                        title: 'Completed Services',
                        value: '$_completedServices jobs',
                        subtitle: 'this month',
                      ),
                      ReportCard(
                        icon: Icons.people_outline,
                        iconColor: AppColors.limeAccent,
                        title: 'Mechanic Productivity',
                        value: _topMechanicName.isEmpty
                            ? 'No data'
                            : _topMechanicName,
                        subtitle: _topMechanicName.isEmpty
                            ? ''
                            : '$_topMechanicJobs jobs completed',
                      ),
                      ReportCard(
                        icon: Icons.inventory_2_outlined,
                        iconColor: AppColors.limeAccent,
                        title: 'Spare Parts Usage',
                        value: _mostUsedPartName.isEmpty
                            ? 'No data'
                            : 'Most used: $_mostUsedPartName',
                        subtitle: 'this month',
                      ),
                      ReportCard(
                        icon: Icons.receipt_long_outlined,
                        iconColor: AppColors.amberAccent,
                        title: 'Pending Payments',
                        value:
                            '₹${_pendingPaymentsTotal.toStringAsFixed(0)}',
                        subtitle: 'action needed',
                        valueColor: AppColors.amberAccent,
                        onTap: () => AppRouter.toPendingPayments(context),
                      ),
                      ReportCard(
                        icon: Icons.warning_amber_rounded,
                        iconColor: AppColors.statusError,
                        title: 'Low Stock Report',
                        value: '$_lowStockCount items critical',
                        subtitle: 'restock recommended',
                        valueColor: AppColors.statusError,
                        onTap: () => AppRouter.toInventory(context),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
