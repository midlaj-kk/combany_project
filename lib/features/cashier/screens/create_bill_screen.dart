import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_care_app/core/theme/app_colors.dart';
import 'package:auto_care_app/core/theme/app_text_styles.dart';
import 'package:auto_care_app/widgets/common/app_button.dart';
import 'package:auto_care_app/features/cashier/bloc/bloc.dart';
import 'package:auto_care_app/features/cashier/bloc/event.dart';
import 'package:auto_care_app/features/cashier/bloc/state.dart';
import 'package:auto_care_app/features/cashier/models/bill_model.dart';
import 'invoice_success_screen.dart';

class CreateBillScreen extends StatefulWidget {
  const CreateBillScreen({
    super.key,
    required this.jobId,
    required this.jobNumber,
    required this.vehicleLabel,
    required this.vehicleModel,
    required this.customerName,
    this.initialLabourCharge = 0,
    this.initialPartsCharge = 0,
  });

  final int jobId;
  final String jobNumber;
  final String vehicleLabel;
  final String vehicleModel;
  final String customerName;
  final double initialLabourCharge;
  final double initialPartsCharge;

  @override
  State<CreateBillScreen> createState() => _CreateBillScreenState();
}

class _CreateBillScreenState extends State<CreateBillScreen> {
  late final TextEditingController _labourController;
  late final TextEditingController _partsController;
  late final TextEditingController _taxController;
  late final TextEditingController _discountController;

  double get _labourCharge => double.tryParse(_labourController.text) ?? 0;
  double get _partsCharge => double.tryParse(_partsController.text) ?? 0;
  double get _tax => double.tryParse(_taxController.text) ?? 0;
  double get _discount => double.tryParse(_discountController.text) ?? 0;
  double get _totalAmount => _labourCharge + _partsCharge + _tax - _discount;

  @override
  void initState() {
    super.initState();
    _labourController = TextEditingController(text: widget.initialLabourCharge.toStringAsFixed(0));
    _partsController = TextEditingController(text: widget.initialPartsCharge.toStringAsFixed(0));
    _taxController = TextEditingController(text: (widget.initialLabourCharge * 0.18).toStringAsFixed(0));
    _discountController = TextEditingController(text: '0');
    _labourController.addListener(_onChanged);
    _partsController.addListener(_onChanged);
    _taxController.addListener(_onChanged);
    _discountController.addListener(_onChanged);
  }

  void _onChanged() => setState(() {});

  @override
  void dispose() {
    _labourController.dispose();
    _partsController.dispose();
    _taxController.dispose();
    _discountController.dispose();
    super.dispose();
  }

  void _submit() {
    context.read<BillingBloc>().add(BillingBillCreateRequested(
      request: BillCreateRequest(
        serviceJob: widget.jobId,
        labourCharge: _labourCharge.toStringAsFixed(2),
        partsCharge: _partsCharge.toStringAsFixed(2),
        tax: _tax.toStringAsFixed(2),
        discount: _discount.toStringAsFixed(2),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BillingBloc, BillingState>(
      listener: (context, state) {
        if (state is BillingBillCreated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => InvoiceSuccessScreen(
                invoiceNumber: state.bill.invoiceNumber ?? '',
                serviceEntity: widget.vehicleModel,
                totalAmount: double.tryParse(state.bill.totalAmount ?? '0') ?? 0,
                billId: state.bill.id,
              ),
            ),
          );
        } else if (state is BillingError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: AppColors.statusError),
          );
        }
      },
      child: Scaffold(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cashier - Create Bill', style: AppTextStyles.heading3),
                          Text(widget.jobNumber, style: AppTextStyles.caption),
                        ],
                      ),
                    ),
                    const Icon(Icons.notifications_outlined, color: AppColors.textPrimary, size: 20),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      radius: 16, backgroundColor: AppColors.inputFill,
                      child: Icon(Icons.person, size: 16, color: AppColors.textMuted),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40, height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.limeAccent.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.directions_car, color: AppColors.limeAccent, size: 20),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('VEHICLE', style: AppTextStyles.caption.copyWith(color: AppColors.limeAccent)),
                                  Text(widget.vehicleModel, style: AppTextStyles.bodyRegular.copyWith(fontWeight: FontWeight.bold)),
                                  Text(widget.vehicleLabel, style: AppTextStyles.caption),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 18, backgroundColor: AppColors.inputFill,
                              child: Icon(Icons.person, size: 18, color: AppColors.textMuted),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('CUSTOMER', style: AppTextStyles.caption.copyWith(letterSpacing: 0.4)),
                                  Text(widget.customerName, style: AppTextStyles.bodyRegular.copyWith(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('BILLING BREAKDOWN', style: AppTextStyles.caption.copyWith(letterSpacing: 0.6)),
                                const Icon(Icons.info_outline, color: AppColors.textMuted, size: 16),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _BillField(label: 'Labour Charge (₹)', controller: _labourController),
                            const SizedBox(height: 14),
                            _BillField(label: 'Parts Charge (₹)', controller: _partsController),
                            const SizedBox(height: 14),
                            _BillField(label: 'Tax (18% GST) (₹)', controller: _taxController),
                            const SizedBox(height: 14),
                            _BillField(label: 'Discount (₹)', controller: _discountController, suffixIcon: Icons.percent),
                            const SizedBox(height: 20),
                            const Divider(color: AppColors.divider),
                            const SizedBox(height: 12),
                            Text('FINAL SETTLEMENT', style: AppTextStyles.caption.copyWith(letterSpacing: 0.6)),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Total\nAmount', style: AppTextStyles.heading2.copyWith(height: 1.1)),
                                Text('₹${_totalAmount.toStringAsFixed(0)}',
                                    style: const TextStyle(color: AppColors.limeAccent, fontWeight: FontWeight.bold, fontSize: 26)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      _MetaChip(icon: Icons.circle, label: 'DRAFT BILL'),
                      const SizedBox(height: 24),
                      BlocBuilder<BillingBloc, BillingState>(
                        builder: (context, state) {
                          return AppButton(
                            label: 'Generate Invoice',
                            icon: Icons.arrow_forward,
                            isLoading: state is BillingLoading,
                            onPressed: _submit,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BillField extends StatelessWidget {
  const _BillField({required this.label, required this.controller, this.suffixIcon});
  final String label;
  final TextEditingController controller;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.caption.copyWith(letterSpacing: 0.3)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            suffixIcon: Icon(suffixIcon ?? Icons.edit_outlined, color: AppColors.textMuted, size: 16),
          ),
        ),
      ],
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 10, color: AppColors.amberAccent),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: AppColors.textMuted, fontSize: 10)),
        ],
      ),
    );
  }
}
