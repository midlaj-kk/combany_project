import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_care_app/core/router/app_router.dart';
import 'package:auto_care_app/core/theme/app_colors.dart';
import 'package:auto_care_app/core/theme/app_text_styles.dart';
import 'package:auto_care_app/widgets/common/role_bottom_nav.dart';
import 'package:auto_care_app/features/cashier/bloc/bloc.dart';
import 'package:auto_care_app/features/cashier/bloc/event.dart';
import 'package:auto_care_app/features/cashier/bloc/state.dart';
import 'package:auto_care_app/features/cashier/models/bill_model.dart';
import '../widgets/pending_payment_tile.dart';
import '../widgets/ready_for_billing_card.dart';

class CashierHomeScreen extends StatefulWidget {
  const CashierHomeScreen({super.key});

  @override
  State<CashierHomeScreen> createState() => _CashierHomeScreenState();
}

class _CashierHomeScreenState extends State<CashierHomeScreen> with RouteAware {
  @override
  void initState() {
    super.initState();
    context.read<BillingBloc>().add(const BillingCashierHomeLoadRequested());
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
    super.dispose();
  }

  @override
  void didPopNext() {
    if (!mounted) return;
    context.read<BillingBloc>().add(const BillingCashierHomeLoadRequested());
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<BillingBloc>().add(const BillingCashierHomeLoadRequested());
          },
          color: AppColors.limeAccent,
          backgroundColor: AppColors.surface,
          child: BlocBuilder<BillingBloc, BillingState>(
            builder: (context, state) {
              if (state is BillingLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.limeAccent),
                );
              }

              if (state is BillingError) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: 80),
                    Center(
                      child: Column(
                        children: [
                          Icon(Icons.error_outline, color: AppColors.statusError, size: 48),
                          const SizedBox(height: 16),
                          Text(state.message, style: AppTextStyles.bodySecondary, textAlign: TextAlign.center),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => context.read<BillingBloc>().add(const BillingCashierHomeLoadRequested()),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              List<dynamic> pendingPayments = [];
              List<dynamic> readyForBilling = [];

              if (state is BillingCashierHomeLoaded) {
                pendingPayments = state.bills.results
                    .where((b) => b.paymentStatus != PaymentStatusEnum.paid)
                    .toList();
                readyForBilling = state.readyForBilling;
              }

              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              Text('Cashier - Home', style: AppTextStyles.heading3),
                              Text('BILLING COUNTER',
                                  style: AppTextStyles.caption.copyWith(letterSpacing: 1)),
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
                    Row(
                      children: [
                        Expanded(
                          child: _StatCard(
                            label: 'READY FOR\nBILLING',
                            value: readyForBilling.length.toString(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatCard(
                            label: 'PENDING\nPAYMENTS',
                            value: pendingPayments.length.toString(),
                            valueColor: AppColors.amberAccent,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _StatCard(
                            label: 'TOTAL\nBILLS',
                            value: '${(state is BillingCashierHomeLoaded) ? state.bills.count : 0}',
                            valueColor: AppColors.limeAccent,
                            isHighlighted: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ready for Billing', style: AppTextStyles.heading3),
                        Text('${readyForBilling.length} JOBS',
                            style: AppTextStyles.caption.copyWith(color: AppColors.limeAccent)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    readyForBilling.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text('No jobs ready for billing',
                                style: AppTextStyles.bodySecondary),
                          )
                        : SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: readyForBilling.length,
                              itemBuilder: (context, index) {
                                final job = readyForBilling[index];
                                return ReadyForBillingCard(
                                  jobNumber: job.jobNumber ?? '',
                                  customerName: job.customerName ?? '',
                                  vehicleInfo: '${job.vehicleNumber ?? ''} • ${job.vehicleModel ?? job.serviceType ?? ''}',
                                  onCreateBill: () => AppRouter.toCreateBill(
                                    context,
                                    jobId: job.id,
                                    jobNumber: job.jobNumber ?? '',
                                    vehicleLabel: job.vehicleNumber ?? '',
                                    vehicleModel: job.vehicleModel ?? '',
                                    customerName: job.customerName ?? '',
                                  ),
                                );
                              },
                            ),
                          ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pending Payments', style: AppTextStyles.heading3),
                        TextButton(
                          onPressed: () => AppRouter.toPendingPayments(context),
                          child: const Text('SEE ALL',
                              style: TextStyle(color: AppColors.limeAccent)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    pendingPayments.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text('No pending payments',
                                style: AppTextStyles.bodySecondary),
                          )
                        : Column(
                            children: pendingPayments.map((bill) {
                              return PendingPaymentTile(
                                customerName: bill.customerName ?? '',
                                invoiceNumber: bill.invoiceNumber ?? '',
                                amount: (double.tryParse(bill.totalAmount ?? '0') ?? 0).toStringAsFixed(0),
                                paymentStatus: bill.paymentStatus?.name ?? 'pending',
                                onTap: () => AppRouter.toRecordPayment(
                                  context,
                                  billId: bill.id,
                                ),
                              );
                            }).toList(),
                          ),
                  ],
                ),
              );
            },
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
          Text(label, textAlign: TextAlign.center,
              style: AppTextStyles.caption.copyWith(letterSpacing: 0.3)),
          const SizedBox(height: 8),
          Text(value, style: AppTextStyles.heading2.copyWith(
            fontSize: 18, color: valueColor ?? AppColors.textPrimary)),
        ],
      ),
    );
  }
}
