import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/app_button.dart';
import '../../../widgets/common/status_badge.dart';
import '../widgets/payment_method_selector.dart';
import 'payment_success_screen.dart';


class RecordPaymentScreen extends StatefulWidget {
  const RecordPaymentScreen({super.key, required this.billId});

  final int billId;

  @override
  State<RecordPaymentScreen> createState() => _RecordPaymentScreenState();
}

class _RecordPaymentScreenState extends State<RecordPaymentScreen> {
  final TextEditingController _amountController = TextEditingController();

  bool _isLoading = true;
  String? _errorMessage;
  Map<String, dynamic>? _bill;

  String _selectedMethod = 'cash';
  final DateTime _paymentDate = DateTime.now();

  bool _isSubmitting = false;
  bool _paidSuccessfully = false;
  bool _fullyPaid = false;

  double get _totalAmount =>
      (_bill?['total_amount'] as num?)?.toDouble() ?? 0;
  double get _amountPaid => (_bill?['amount_paid'] as num?)?.toDouble() ?? 0;
  double get _remaining => _totalAmount - _amountPaid;

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
      final bill = await DemoRepository.instance.getBillDetail(widget.billId);
      if (!mounted) return;
      setState(() => _bill = bill);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not load bill. Pull down to retry.';
      });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _selectMethod(String method) {
    setState(() => _selectedMethod = method);
  }

  void _payFullAmount() {
    _amountController.text = _remaining.toStringAsFixed(0);
    setState(() {});
  }

  Future<void> _confirmPayment() async {
    final amount = double.tryParse(_amountController.text.trim()) ?? 0;
    if (amount <= 0) {
      setState(() {
        _errorMessage = 'Please enter a valid amount';
      });
      return;
    }

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    try {
      await DemoRepository.instance.recordPayment(
        billId: widget.billId,
        paymentMethod: _selectedMethod,
        paidAmount: amount,
        paymentDate:
            '${_paymentDate.year}-${_paymentDate.month.toString().padLeft(2, '0')}-${_paymentDate.day.toString().padLeft(2, '0')}',
      );
      if (!mounted) return;
      setState(() {
        _fullyPaid = amount >= _remaining;
        _paidSuccessfully = true;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Something went wrong. Please try again.';
      });
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_paidSuccessfully) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => PaymentSuccessScreen(
              amountPaid:
                  double.tryParse(_amountController.text) ?? 0,
              fullyPaid: _fullyPaid,
              invoiceNumber: _bill?['invoice_number'] ?? '',
              vehicleModel: _bill?['job_number'] ?? '',
              serviceType: 'Service Payment',
            ),
          ),
        );
      });
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.limeAccent),
              )
            : _errorMessage != null && _bill == null
                ? Center(
                    child: Text(_errorMessage!,
                        style: AppTextStyles.bodySecondary),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Record Payment',
                                      style: AppTextStyles.heading3
                                          .copyWith(
                                              color: AppColors.limeAccent)),
                                  Text(_bill?['invoice_number'] ?? '',
                                      style: AppTextStyles.caption),
                                ],
                              ),
                            ),
                            const Icon(Icons.history,
                                color: AppColors.textPrimary, size: 20),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // --- Bill summary card ---
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('BILL SUMMARY',
                                      style: AppTextStyles.caption
                                          .copyWith(letterSpacing: 0.5)),
                                  StatusBadge(
                                      status:
                                          _bill?['payment_status'] ??
                                              'pending'),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _AmountBlock(
                                    label: 'Total Amount',
                                    value: _totalAmount.toStringAsFixed(0),
                                  ),
                                  _AmountBlock(
                                    label: 'Amount Paid',
                                    value:
                                        _amountPaid.toStringAsFixed(0),
                                    align: CrossAxisAlignment.end,
                                  ),
                                ],
                              ),
                              const Divider(
                                  color: AppColors.divider, height: 24),
                              Text('Remaining',
                                  style: AppTextStyles.caption
                                      .copyWith(letterSpacing: 0.4)),
                              const SizedBox(height: 4),
                              Text(
                                '₹${_remaining.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  color: AppColors.limeAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text('Select Payment Method',
                            style: AppTextStyles.caption
                                .copyWith(letterSpacing: 0.4)),
                        const SizedBox(height: 10),
                        PaymentMethodSelector(
                          selectedMethod: _selectedMethod,
                          onSelected: _selectMethod,
                        ),
                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Amount to Pay',
                                style: AppTextStyles.caption
                                    .copyWith(letterSpacing: 0.4)),
                            TextButton(
                              onPressed: _payFullAmount,
                              child: const Text('Pay Full Amount',
                                  style: TextStyle(
                                      color: AppColors.limeAccent,
                                      fontSize: 12)),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.inputFill,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.currency_rupee,
                                  color: AppColors.limeAccent, size: 22),
                              Expanded(
                                child: TextField(
                                  controller: _amountController,
                                  keyboardType: const TextInputType
                                      .numberWithOptions(decimal: true),
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.heading1
                                      .copyWith(fontSize: 30),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '0',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: AppColors.cardBackground,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined,
                                  color: AppColors.textMuted, size: 16),
                              const SizedBox(width: 10),
                              Text('Payment Date',
                                  style: AppTextStyles.caption),
                              const Spacer(),
                              Text(
                                '${_paymentDate.day.toString().padLeft(2, '0')}-'
                                '${_monthAbbr(_paymentDate.month)}-'
                                '${_paymentDate.year}',
                                style: const TextStyle(
                                    color: AppColors.limeAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                              const SizedBox(width: 6),
                              const Icon(Icons.calendar_today_outlined,
                                  color: AppColors.textMuted, size: 14),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.amberAccent.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.info_outline,
                                  color: AppColors.amberAccent, size: 16),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Funds will be credited to the main '
                                  'dealership account. Ensure the customer '
                                  'has received their digital copy of the '
                                  'invoice.',
                                  style: AppTextStyles.caption,
                                ),
                              ),
                            ],
                          ),
                        ),

                        if (_errorMessage != null) ...[
                          const SizedBox(height: 14),
                          Text(
                            _errorMessage!,
                            style: const TextStyle(
                                color: AppColors.statusError, fontSize: 13),
                          ),
                        ],

                        const SizedBox(height: 24),
                        AppButton(
                          label: 'Confirm Payment',
                          icon: Icons.check_circle_outline,
                          isLoading: _isSubmitting,
                          onPressed: _confirmPayment,
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

  String _monthAbbr(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}

class _AmountBlock extends StatelessWidget {
  const _AmountBlock({
    required this.label,
    required this.value,
    this.align = CrossAxisAlignment.start,
  });

  final String label;
  final String value;
  final CrossAxisAlignment align;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align,
      children: [
        Text(label, style: AppTextStyles.caption),
        const SizedBox(height: 4),
        Text('₹$value',
            style: AppTextStyles.heading3.copyWith(fontSize: 18)),
      ],
    );
  }
}
