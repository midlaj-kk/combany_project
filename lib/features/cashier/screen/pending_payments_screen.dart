import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/role_bottom_nav.dart';
import '../widgets/pending_payment_card.dart';
import 'record_payment_screen.dart';

/// Cashier "Pending Payments" screen.
class PendingPaymentsScreen extends StatefulWidget {
  const PendingPaymentsScreen({super.key});

  @override
  State<PendingPaymentsScreen> createState() => _PendingPaymentsScreenState();
}

class _PendingPaymentsScreenState extends State<PendingPaymentsScreen> {
  static const _tabs = [
    ('all', 'All'),
    ('pending', 'Pending'),
    ('partial', 'Partial'),
  ];

  bool _isLoading = true;
  String? _errorMessage;
  String _selectedFilter = 'all'; // all | pending | partial
  List<dynamic> _allBills = [];

  List<dynamic> get _filteredBills => _selectedFilter == 'all'
      ? _allBills
      : _allBills
          .where((b) => b['payment_status'] == _selectedFilter)
          .toList();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final bills = await DemoRepository.instance.getPendingPayments();
      if (!mounted) return;
      setState(() => _allBills = bills);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not load pending payments. Pull down to retry.';
      });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _setFilter(String filter) {
    setState(() => _selectedFilter = filter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // --- Header ---
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.textPrimary),
                  ),
                  Expanded(
                    child: Text('Cashier - Pending Payments',
                        style: AppTextStyles.heading3),
                  ),
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.inputFill,
                    child: Icon(Icons.person,
                        size: 16, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // --- Filter tabs ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: _tabs.map((entry) {
                  final (value, label) = entry;
                  final isSelected = value == _selectedFilter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => _setFilter(value),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.limeAccent
                              : AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          label,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.black
                                : AppColors.textSecondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            // --- List ---
            Expanded(
              child: RefreshIndicator(
                onRefresh: _load,
                color: AppColors.limeAccent,
                backgroundColor: AppColors.surface,
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.limeAccent),
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
                        : _filteredBills.isEmpty
                            ? ListView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                children: [
                                  const SizedBox(height: 80),
                                  Center(
                                    child: Text('No pending payments',
                                        style: AppTextStyles.bodySecondary),
                                  ),
                                ],
                              )
                            : ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                itemCount: _filteredBills.length,
                                itemBuilder: (context, index) {
                                  final bill = _filteredBills[index];
                                  return PendingPaymentCard(
                                    customerName:
                                        bill['customer_name'] ?? '',
                                    invoiceNumber:
                                        bill['invoice_number'] ?? '',
                                    vehicleNumber:
                                        bill['vehicle_number'] ?? '',
                                    totalAmount:
                                        (bill['total_amount'] as num?)
                                                ?.toDouble() ??
                                            0,
                                    paidAmount:
                                        (bill['amount_paid'] as num?)
                                                ?.toDouble() ??
                                            0,
                                    paymentStatus:
                                        bill['payment_status'] ?? 'pending',
                                    onCollectPayment: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              RecordPaymentScreen(
                                            billId: bill['id'],
                                          ),
                                        ),
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
      bottomNavigationBar:
          const RoleBottomNav(role: 'cashier', activeIndex: 1),
    );
  }
}
