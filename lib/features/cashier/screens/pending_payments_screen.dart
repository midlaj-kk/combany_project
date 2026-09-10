import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_care_app/core/theme/app_colors.dart';
import 'package:auto_care_app/core/theme/app_text_styles.dart';
import 'package:auto_care_app/widgets/common/role_bottom_nav.dart';
import 'package:auto_care_app/features/cashier/bloc/bloc.dart';
import 'package:auto_care_app/features/cashier/bloc/event.dart';
import 'package:auto_care_app/features/cashier/bloc/state.dart';
import 'package:auto_care_app/core/router/app_router.dart';
import '../models/bill_model.dart';
import '../widgets/pending_payment_card.dart';

class PendingPaymentsScreen extends StatefulWidget {
  const PendingPaymentsScreen({super.key});

  @override
  State<PendingPaymentsScreen> createState() => _PendingPaymentsScreenState();
}

class _PendingPaymentsScreenState extends State<PendingPaymentsScreen>
    with RouteAware {
  static const _tabs = [('all', 'All'), ('pending', 'Pending'), ('partial', 'Partial')];
  String _selectedFilter = 'all';

  @override
  void initState() {
    super.initState();
    context.read<BillingBloc>().add(const BillingBillsLoadRequested());
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

  void _reload() {
    context.read<BillingBloc>().add(const BillingBillsLoadRequested());
  }

  @override
  void didPopNext() {
    _reload();
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                  ),
                  Expanded(
                    child: Text('Cashier - Pending Payments', style: AppTextStyles.heading3),
                  ),
                  const CircleAvatar(
                    radius: 16, backgroundColor: AppColors.inputFill,
                    child: Icon(Icons.person, size: 16, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: _tabs.map((entry) {
                  final (value, label) = entry;
                  final isSelected = value == _selectedFilter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedFilter = value),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.limeAccent : AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(label, style: TextStyle(
                          color: isSelected ? Colors.black : AppColors.textSecondary,
                          fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<BillingBloc>().add(const BillingBillsLoadRequested());
                },
                color: AppColors.limeAccent,
                backgroundColor: AppColors.surface,
                child: BlocBuilder<BillingBloc, BillingState>(
                  builder: (context, state) {
                    if (state is BillingLoading) {
                      return const Center(child: CircularProgressIndicator(color: AppColors.limeAccent));
                    }
                    if (state is BillingError) {
                      return ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: 80),
                          Center(child: Text(state.message, style: AppTextStyles.bodySecondary)),
                        ],
                      );
                    }
                    List<dynamic> allBills = [];
                    if (state is BillingBillsLoaded) {
                      allBills = state.bills.results;
                    }
                    final filtered = _selectedFilter == 'all'
                        ? allBills
                            .where((b) => b.paymentStatus != PaymentStatusEnum.paid)
                            .toList()
                        : allBills
                            .where((b) => b.paymentStatus?.name == _selectedFilter)
                            .toList();
                    if (filtered.isEmpty) {
                      return ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: 80),
                          Center(child: Text('No pending payments', style: AppTextStyles.bodySecondary)),
                        ],
                      );
                    }
                    return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final bill = filtered[index];
                        return PendingPaymentCard(
                          customerName: bill.customerName ?? '',
                          invoiceNumber: bill.invoiceNumber ?? '',
                          vehicleNumber: bill.vehicleNumber ?? '',
                          totalAmount: double.tryParse(bill.totalAmount ?? '0') ?? 0,
                          paidAmount: double.tryParse(bill.amountPaid ?? '0') ?? 0,
                          paymentStatus: bill.paymentStatus?.name ?? 'pending',
                          onCollectPayment: () {
                            AppRouter.toRecordPayment(context, billId: bill.id);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const RoleBottomNav(role: 'cashier', activeIndex: 1),
    );
  }
}
