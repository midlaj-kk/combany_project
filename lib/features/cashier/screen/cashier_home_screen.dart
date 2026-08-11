import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:auto_care_app/widgets/common/role_bottom_nav.dart';
import 'package:flutter/material.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/pending_payment_tile.dart';
import '../widgets/ready_for_billing_card.dart';

/// Cashier home screen — matches the Stitch "Cashier Home
/// Dashboard" design. Reads static demo data directly from
/// [DemoRepository].
class CashierHomeScreen extends StatefulWidget {
  const CashierHomeScreen({super.key});

  @override
  State<CashierHomeScreen> createState() => _CashierHomeScreenState();
}

class _CashierHomeScreenState extends State<CashierHomeScreen> {
  bool _isLoading = true;
  String? _errorMessage;

  List<dynamic> _readyForBilling = [];
  List<dynamic> _pendingPayments = [];
  double _revenueToday = 0;

  @override
  void initState() {
    super.initState();
    _loadHome();
  }

  Future<void> _loadHome() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final readyForBilling =
          await DemoRepository.instance.getJobsReadyForBilling();
      final pendingPayments =
          await DemoRepository.instance.getPendingPayments();
      final summary = await DemoRepository.instance.getDashboardSummary();

      if (!mounted) return;
      setState(() {
        _readyForBilling = readyForBilling;
        _pendingPayments = pendingPayments;
        _revenueToday =
            (summary['revenue_today'] as num?)?.toDouble() ?? 0;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not load data. Pull down to retry.';
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
        child: RefreshIndicator(
          onRefresh: _loadHome,
          color: AppColors.limeAccent,
          backgroundColor: AppColors.surface,
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.limeAccent),
                )
              : _errorMessage != null
                  ? ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: 80),
                        Center(
                          child: Text(_errorMessage!,
                              style: AppTextStyles.bodySecondary),
                        ),
                      ],
                    )
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Cashier - Home',
                                        style: AppTextStyles.heading3),
                                    Text('BILLING COUNTER',
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
                                child: const Icon(
                                    Icons.notifications_outlined,
                                    color: AppColors.textPrimary,
                                    size: 20),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // --- Stat cards ---
                          Row(
                            children: [
                              Expanded(
                                child: _StatCard(
                                  label: 'READY FOR\nBILLING',
                                  value:
                                      _readyForBilling.length.toString(),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _StatCard(
                                  label: 'PENDING\nPAYMENTS',
                                  value: _pendingPayments.length.toString(),
                                  valueColor: AppColors.amberAccent,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _StatCard(
                                  label: 'REVENUE\nTODAY',
                                  value:
                                      '₹${_revenueToday.toStringAsFixed(0)}',
                                  valueColor: AppColors.limeAccent,
                                  isHighlighted: true,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // --- Ready for Billing ---
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Ready for Billing',
                                  style: AppTextStyles.heading3),
                              Text(
                                '${_readyForBilling.length} JOBS',
                                style: AppTextStyles.caption
                                    .copyWith(color: AppColors.limeAccent),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          _readyForBilling.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12),
                                  child: Text('No jobs ready for billing',
                                      style: AppTextStyles.bodySecondary),
                                )
                              : SizedBox(
                                  height: 150,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _readyForBilling.length,
                                    itemBuilder: (context, index) {
                                      final job = _readyForBilling[index];
                                      return ReadyForBillingCard(
                                        jobNumber: job['job_number'] ?? '',
                                        customerName:
                                            job['customer_name'] ?? '',
                                        vehicleInfo:
                                            '${job['vehicle_number'] ?? ''} • ${job['service_type'] ?? ''}',
                                        onCreateBill: () =>
                                            AppRouter.toCreateBill(
                                          context,
                                          jobId: job['id'],
                                          jobNumber:
                                              job['job_number'] ?? '',
                                          vehicleLabel:
                                              job['vehicle_number'] ?? '',
                                          vehicleModel:
                                              job['service_type'] ?? '',
                                          customerName:
                                              job['customer_name'] ?? '',
                                        ),
                                      );
                                    },
                                  ),
                                ),
                          const SizedBox(height: 24),

                          // --- Pending Payments ---
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Pending Payments',
                                  style: AppTextStyles.heading3),
                              TextButton(
                                onPressed: () =>
                                    AppRouter.toPendingPayments(context),
                                child: const Text('SEE ALL',
                                    style: TextStyle(
                                        color: AppColors.limeAccent)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),

                          _pendingPayments.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12),
                                  child: Text('No pending payments',
                                      style: AppTextStyles.bodySecondary),
                                )
                              : Column(
                                  children: _pendingPayments.map((bill) {
                                    return PendingPaymentTile(
                                      customerName:
                                          bill['customer_name'] ?? '',
                                      invoiceNumber:
                                          bill['invoice_number'] ?? '',
                                      amount: (bill['total_amount']
                                                  as num?)
                                              ?.toStringAsFixed(0) ??
                                          '0',
                                      paymentStatus:
                                          bill['payment_status'] ??
                                              'pending',
                                      onTap: () =>
                                          AppRouter.toRecordPayment(
                                        context,
                                        billId: bill['id'],
                                      ),
                                    );
                                  }).toList(),
                                ),
                        ],
                      ),
                    ),
        ),
      ),
      bottomNavigationBar: const RoleBottomNav(role: 'cashier'),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    this.valueColor,
    this.isHighlighted = false,
  });

  final String label;
  final String value;
  final Color? valueColor;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: isHighlighted
            ? AppColors.limeAccent.withValues(alpha: 0.12)
            : AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.caption.copyWith(letterSpacing: 0.3),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTextStyles.heading2.copyWith(
              fontSize: 18,
              color: valueColor ?? AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
