import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_care_app/core/theme/app_colors.dart';
import 'package:auto_care_app/core/theme/app_text_styles.dart';
import 'package:auto_care_app/widgets/common/animated_checkmark.dart';
import 'package:auto_care_app/widgets/common/app_button.dart';
import 'package:auto_care_app/widgets/common/role_bottom_nav.dart';
import 'package:auto_care_app/features/cashier/bloc/bloc.dart';
import 'package:auto_care_app/features/cashier/bloc/event.dart';
import 'package:auto_care_app/features/cashier/bloc/state.dart';
import 'package:auto_care_app/features/cashier/models/delivery_model.dart';

class CompleteDeliveryScreen extends StatefulWidget {
  const CompleteDeliveryScreen({
    super.key,
    required this.jobId,
    required this.jobNumber,
    required this.vehicleLabel,
    required this.customerName,
  });

  final int jobId;
  final String jobNumber;
  final String vehicleLabel;
  final String customerName;

  @override
  State<CompleteDeliveryScreen> createState() => _CompleteDeliveryScreenState();
}

class _CompleteDeliveryScreenState extends State<CompleteDeliveryScreen> {
  DateTime _deliveryDateTime = DateTime.now();
  bool _customerReceived = true;
  final TextEditingController _remarksController = TextEditingController();
  bool _completedSuccessfully = false;

  void _setDateTime(DateTime newDateTime) => setState(() => _deliveryDateTime = newDateTime);
  void _toggleCustomerReceived(bool value) => setState(() => _customerReceived = value);

  void _submit() {
    final now = _deliveryDateTime;
    final dateStr = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}'
        'T${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:00';
    context.read<BillingBloc>().add(BillingDeliveryCreateRequested(
      request: DeliveryCreateRequest(
        serviceJob: widget.jobId,
        deliveryDate: dateStr,
        customerReceived: _customerReceived,
        remarks: _remarksController.text.trim().isNotEmpty ? _remarksController.text.trim() : null,
      ),
    ));
  }

  @override
  void dispose() {
    _remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BillingBloc, BillingState>(
      listener: (context, state) {
        if (state is BillingDeliveryCreated) {
          setState(() => _completedSuccessfully = true);
        } else if (state is BillingError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: AppColors.statusError),
          );
        }
      },
      child: _completedSuccessfully
          ? Scaffold(
              backgroundColor: AppColors.background,
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                  child: Column(
                    children: [
                      Text('AUTOCARE PRO', style: AppTextStyles.caption.copyWith(
                          color: AppColors.limeAccent, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                      const SizedBox(height: 24),
                      const AnimatedCheckmark(filled: true),
                      const SizedBox(height: 20),
                      Text('Vehicle Delivered\nSuccessfully 🎉',
                          textAlign: TextAlign.center, style: AppTextStyles.heading1),
                      const SizedBox(height: 8),
                      Text('The service lifecycle for ${widget.jobNumber} is now complete.',
                          textAlign: TextAlign.center, style: AppTextStyles.bodySecondary),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.statusSuccess.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('JOB COMPLETE',
                            style: TextStyle(color: AppColors.statusSuccess, fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 0.5)),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: AppColors.cardBackground, borderRadius: BorderRadius.circular(18)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('SERVICE SUMMARY', style: AppTextStyles.caption.copyWith(letterSpacing: 0.5)),
                            const SizedBox(height: 14),
                            _SummaryRow(icon: Icons.directions_car_outlined, label: 'Vehicle', value: widget.vehicleLabel),
                            const SizedBox(height: 12),
                            _SummaryRow(icon: Icons.person_outline, label: 'Owner', value: widget.customerName),
                            const SizedBox(height: 12),
                            _SummaryRow(
                              icon: Icons.event_available_outlined,
                              label: 'Delivered On',
                              value: '${_monthName(_deliveryDateTime.month)} ${_deliveryDateTime.day}, ${_deliveryDateTime.year}',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                          child: const Text('Back to Home'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: const RoleBottomNav(role: 'cashier', activeIndex: 2),
            )
          : Scaffold(
              backgroundColor: AppColors.background,
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.of(context).maybePop(),
                            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                          ),
                          Expanded(
                            child: Text('Cashier - Complete Delivery', style: AppTextStyles.heading3),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: AppColors.cardBackground, borderRadius: BorderRadius.circular(18)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('VEHICLE', style: AppTextStyles.caption.copyWith(letterSpacing: 0.5)),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.limeAccent.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text('PREMIUM',
                                      style: TextStyle(color: AppColors.limeAccent, fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(widget.vehicleLabel, style: AppTextStyles.heading3),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('CUSTOMER', style: AppTextStyles.caption.copyWith(letterSpacing: 0.4)),
                                      Text(widget.customerName, style: AppTextStyles.bodyRegular.copyWith(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('JOB NUMBER', style: AppTextStyles.caption.copyWith(letterSpacing: 0.4)),
                                    Text(widget.jobNumber,
                                        style: const TextStyle(color: AppColors.limeAccent, fontWeight: FontWeight.bold, fontSize: 13)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text('DELIVERY DATE & TIME', style: AppTextStyles.caption.copyWith(letterSpacing: 0.5)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(color: AppColors.inputFill, borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            const Icon(Icons.event_available_outlined, color: AppColors.limeAccent, size: 18),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                '${_monthAbbr(_deliveryDateTime.month)} ${_deliveryDateTime.day}, ${_deliveryDateTime.year} - ${_formatHour(_deliveryDateTime)}',
                                style: AppTextStyles.bodyRegular.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () async {
                                final pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: _deliveryDateTime,
                                  firstDate: DateTime.now().subtract(const Duration(days: 1)),
                                  lastDate: DateTime.now().add(const Duration(days: 365)),
                                );
                                if (pickedDate == null || !context.mounted) return;
                                final pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(_deliveryDateTime),
                                );
                                if (pickedTime == null || !context.mounted) return;
                                _setDateTime(DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute));
                              },
                              icon: const Icon(Icons.edit_outlined, color: AppColors.textMuted, size: 16),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: AppColors.cardBackground, borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            Expanded(child: Text('Customer Received Vehicle', style: AppTextStyles.bodyRegular)),
                            Switch(
                              value: _customerReceived,
                              activeThumbColor: AppColors.limeAccent,
                              onChanged: _toggleCustomerReceived,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text('FINAL REMARKS', style: AppTextStyles.caption.copyWith(letterSpacing: 0.5)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _remarksController,
                        maxLines: 3,
                        style: const TextStyle(color: AppColors.textPrimary),
                        decoration: const InputDecoration(hintText: 'Any final notes...'),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: AppColors.inputFill,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.divider),
                        ),
                        child: Column(
                          children: [
                            const Icon(Icons.draw_outlined, color: AppColors.textMuted, size: 20),
                            const SizedBox(height: 6),
                            Text('Tap to capture signature', style: AppTextStyles.caption),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      BlocBuilder<BillingBloc, BillingState>(
                        builder: (context, state) {
                          return AppButton(
                            label: 'Confirm Delivery',
                            icon: Icons.local_shipping_outlined,
                            isLoading: state is BillingLoading,
                            onPressed: _submit,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: const RoleBottomNav(role: 'cashier', activeIndex: 2),
            ),
    );
  }

  String _monthAbbr(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }

  String _formatHour(DateTime dt) {
    final hour12 = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final period = dt.hour < 12 ? 'AM' : 'PM';
    return '$hour12:${dt.minute.toString().padLeft(2, '0')} $period';
  }

  String _monthName(int month) {
    const months = ['January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'];
    return months[month - 1];
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34, height: 34,
          decoration: BoxDecoration(
            color: AppColors.limeAccent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.limeAccent, size: 16),
        ),
        const SizedBox(width: 12),
        Text(label, style: AppTextStyles.caption),
        const Spacer(),
        Flexible(
          child: Text(value, textAlign: TextAlign.end, overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodyRegular.copyWith(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
