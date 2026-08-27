import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../services/admin_service.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';
import '../widgets/report_card.dart';

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

  bool _revenueLoaded = false;
  bool _completedLoaded = false;
  bool _productivityLoaded = false;
  bool _usageLoaded = false;

  bool get _allLoaded =>
      _revenueLoaded && _completedLoaded && _productivityLoaded && _usageLoaded;

  void _handleState(BuildContext context, AdminState state) {
    if (state is AdminMonthlyRevenueLoaded) {
      setState(() {
        _revenueThisMonth =
            (state.data['total_revenue'] as num?)?.toDouble() ?? 0;
        _revenueLoaded = true;
        _isLoading = !_allLoaded;
      });
    } else if (state is AdminCompletedServicesLoaded) {
      setState(() {
        _completedServices = state.data['total_completed'] ?? 0;
        _completedLoaded = true;
        _isLoading = !_allLoaded;
      });
    } else if (state is AdminMechanicProductivityLoaded) {
      final mechanics =
          state.data['mechanics'] as List<dynamic>? ?? [];
      setState(() {
        if (mechanics.isNotEmpty) {
          _topMechanicName = mechanics.first['mechanic_name'] ?? '';
          _topMechanicJobs = mechanics.first['completed_jobs'] ?? 0;
        }
        _productivityLoaded = true;
        _isLoading = !_allLoaded;
      });
    } else if (state is AdminSparePartsUsageLoaded) {
      final parts = state.data['parts'] as List<dynamic>? ?? [];
      setState(() {
        if (parts.isNotEmpty) {
          _mostUsedPartName = parts.first['part_name'] ?? '';
        }
        _usageLoaded = true;
        _isLoading = !_allLoaded;
      });
    } else if (state is AdminError) {
      setState(() {
        _errorMessage = state.message;
        _isLoading = false;
      });
    }
  }

  void _loadReports(BuildContext context) {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _revenueLoaded = false;
      _completedLoaded = false;
      _productivityLoaded = false;
      _usageLoaded = false;
    });
    context.read<AdminBloc>()
      ..add(const AdminMonthlyRevenueRequested())
      ..add(const AdminCompletedServicesRequested())
      ..add(const AdminMechanicProductivityRequested())
      ..add(const AdminSparePartsUsageRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminBloc(service: getIt<AdminService>())
        ..add(const AdminMonthlyRevenueRequested())
        ..add(const AdminCompletedServicesRequested())
        ..add(const AdminMechanicProductivityRequested())
        ..add(const AdminSparePartsUsageRequested()),
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: BlocListener<AdminBloc, AdminState>(
              listener: _handleState,
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.limeAccent),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        _loadReports(context);
                      },
                      color: AppColors.limeAccent,
                      backgroundColor: AppColors.surface,
                      child: SingleChildScrollView(
                        physics:
                            const AlwaysScrollableScrollPhysics(),
                        padding:
                            const EdgeInsets.fromLTRB(20, 8, 20, 32),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      Navigator.of(context)
                                          .maybePop(),
                                  icon: const Icon(
                                      Icons.arrow_back,
                                      color: AppColors
                                          .textPrimary),
                                ),
                                Expanded(
                                  child: Text(
                                      'Admin - Reports',
                                      style: AppTextStyles
                                          .heading3),
                                ),
                                const Icon(
                                    Icons
                                        .calendar_today_outlined,
                                    color: AppColors
                                        .textPrimary,
                                    size: 20),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 8),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.cardBackground,
                                borderRadius:
                                    BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize:
                                    MainAxisSize.min,
                                children: [
                                  Text('This Month',
                                      style: AppTextStyles
                                          .bodySecondary),
                                  const SizedBox(width: 4),
                                  const Icon(
                                      Icons
                                          .keyboard_arrow_down,
                                      color: AppColors
                                          .textMuted,
                                      size: 18),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'BUSINESS HEALTH',
                              style: AppTextStyles.caption
                                  .copyWith(
                                color:
                                    AppColors.limeAccent,
                                letterSpacing: 0.8,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text('Operational Overview',
                                style: AppTextStyles.heading1
                                    .copyWith(fontSize: 26)),
                            const SizedBox(height: 20),
                            if (_errorMessage != null) ...[
                              Text(_errorMessage!,
                                  style: const TextStyle(
                                      color: AppColors
                                          .statusError,
                                      fontSize: 13)),
                              const SizedBox(height: 12),
                            ],
                            ReportCard(
                              icon: Icons.show_chart,
                              iconColor:
                                  AppColors.statusSuccess,
                              title: 'Revenue Report',
                              value:
                                  '\u20B9${_revenueThisMonth.toStringAsFixed(0)}',
                              subtitle: 'this month',
                            ),
                            ReportCard(
                              icon: Icons.verified_outlined,
                              iconColor:
                                  AppColors.statusSuccess,
                              title:
                                  'Completed Services',
                              value:
                                  '$_completedServices jobs',
                              subtitle: 'this month',
                            ),
                            ReportCard(
                              icon: Icons.people_outline,
                              iconColor:
                                  AppColors.limeAccent,
                              title:
                                  'Mechanic Productivity',
                              value: _topMechanicName
                                      .isEmpty
                                  ? 'No data'
                                  : _topMechanicName,
                              subtitle: _topMechanicName
                                      .isEmpty
                                  ? ''
                                  : '$_topMechanicJobs jobs completed',
                            ),
                            ReportCard(
                              icon: Icons
                                  .inventory_2_outlined,
                              iconColor:
                                  AppColors.limeAccent,
                              title:
                                  'Spare Parts Usage',
                              value: _mostUsedPartName
                                      .isEmpty
                                  ? 'No data'
                                  : 'Most used: $_mostUsedPartName',
                              subtitle: 'this month',
                            ),
                            ReportCard(
                              icon: Icons
                                  .receipt_long_outlined,
                              iconColor:
                                  AppColors.amberAccent,
                              title:
                                  'Pending Payments',
                              value:
                                  '\u20B9${_pendingPaymentsTotal.toStringAsFixed(0)}',
                              subtitle: 'action needed',
                              valueColor:
                                  AppColors.amberAccent,
                              onTap: () => AppRouter
                                  .toPendingPayments(
                                      context),
                            ),
                            ReportCard(
                              icon: Icons
                                  .warning_amber_rounded,
                              iconColor:
                                  AppColors.statusError,
                              title: 'Low Stock Report',
                              value:
                                  '$_lowStockCount items critical',
                              subtitle:
                                  'restock recommended',
                              valueColor:
                                  AppColors.statusError,
                              onTap: () => AppRouter
                                  .toInventory(context),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
