import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';


/// Result returned by [RazorpayDemoSheet] when it closes.
///
/// This is a DEMO ONLY - no real money is moved and no real Razorpay keys are
/// used. `success` tells the caller whether the simulated payment went through.
class RazorpayDemoResult {
  final bool success;
  final String orderId;
  final String paymentId;

  const RazorpayDemoResult({
    required this.success,
    required this.orderId,
    required this.paymentId,
  });
}


/// Simulates a Razorpay checkout sheet for presentations.
///
/// Flow: "Creating Razorpay order..." -> payment screen -> "Verifying payment
/// signature..." -> success / failed. On success it pops with a
/// [RazorpayDemoResult] carrying the demo order & payment ids.
class RazorpayDemoSheet extends StatefulWidget {
  const RazorpayDemoSheet({
    super.key,
    required this.amount,
    required this.invoiceNumber,
  });

  final double amount;
  final String invoiceNumber;

  @override
  State<RazorpayDemoSheet> createState() => _RazorpayDemoSheetState();
}

class _RazorpayDemoSheetState extends State<RazorpayDemoSheet> {
  // phase: creating -> ready -> loading -> verifying -> success / failed
  String _phase = 'creating';
  String _orderId = '';
  String _paymentId = '';

  Random get _random => Random();

  String _randomDigits(int length) {
    final buffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      buffer.write(_random.nextInt(10));
    }
    return buffer.toString();
  }

  @override
  void initState() {
    super.initState();
    _createOrder();
  }

  Future<void> _createOrder() async {
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    setState(() {
      _orderId = 'order_DEMO${_randomDigits(6)}';
      _phase = 'ready';
    });
  }

  Future<void> _payNow() async {
    setState(() => _phase = 'loading');
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _phase = 'verifying');
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() {
      _paymentId = 'pay_DEMO${_randomDigits(6)}';
      _phase = 'success';
    });
    await Future<void>.delayed(const Duration(milliseconds: 1400));
    if (!mounted) return;
    Navigator.of(context).pop(
      RazorpayDemoResult(
        success: true,
        orderId: _orderId,
        paymentId: _paymentId,
      ),
    );
  }

  Future<void> _simulateFailure() async {
    setState(() => _phase = 'loading');
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _phase = 'failed');
  }

  void _cancel() {
    Navigator.of(context).pop(
      const RazorpayDemoResult(success: false, orderId: '', paymentId: ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header ---
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.inputFill,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.limeAccent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.account_balance_wallet,
                      color: AppColors.limeAccent, size: 20),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('RAZORPAY CHECKOUT',
                          style: AppTextStyles.caption.copyWith(
                            letterSpacing: 0.8,
                            color: AppColors.limeAccent,
                            fontWeight: FontWeight.bold,
                          )),
                      Text('Demo mode - no real payment',
                          style: AppTextStyles.caption),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // --- Order summary ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('INVOICE',
                      style: AppTextStyles.caption.copyWith(letterSpacing: 0.5)),
                  const SizedBox(height: 2),
                  Text(widget.invoiceNumber,
                      style: AppTextStyles.bodyRegular
                          .copyWith(fontWeight: FontWeight.bold)),
                  const Divider(color: AppColors.divider, height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order ID', style: AppTextStyles.caption),
                      Text(
                        _orderId.isEmpty ? '-' : _orderId,
                        style: AppTextStyles.caption
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Amount', style: AppTextStyles.caption),
                      Text(
                        '₹${widget.amount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: AppColors.limeAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // --- Card preview (fake, for the demo) ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.inputFill,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.credit_card,
                      color: AppColors.textMuted, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'XXXX XXXX XXXX 4242',
                      style: AppTextStyles.bodyRegular
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text('VISA',
                      style: AppTextStyles.caption
                          .copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- Status / actions ---
            if (_phase == 'creating' || _phase == 'loading')
              _StatusRow(
                icon: const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.limeAccent,
                  ),
                ),
                message: _phase == 'creating'
                    ? 'Creating Razorpay order...'
                    : 'Processing payment...',
              )
            else if (_phase == 'verifying')
              _StatusRow(
                icon: const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.limeAccent,
                  ),
                ),
                message: 'Verifying payment signature...',
              )
            else if (_phase == 'success')
              _StatusRow(
                icon: const Icon(Icons.check_circle,
                    color: AppColors.statusSuccess, size: 20),
                message: 'Payment successful ($_paymentId)',
              )
            else if (_phase == 'failed')
              _StatusRow(
                icon: const Icon(Icons.error_outline,
                    color: AppColors.statusError, size: 20),
                message: 'Payment failed. Please try again.',
              )
            else ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _payNow,
                  icon: const Icon(Icons.lock, color: Colors.black, size: 18),
                  label: Text('Pay ₹${widget.amount.toStringAsFixed(2)}'),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: _simulateFailure,
                  child: const Text('Simulate failed payment',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      )),
                ),
              ),
            ],

            if (_phase == 'failed') ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => setState(() => _phase = 'ready'),
                  child: const Text('Try Again'),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: _cancel,
                  child: const Text('Cancel Payment',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      )),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({required this.icon, required this.message});

  final Widget icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(width: 10),
        Flexible(
          child: Text(message,
              textAlign: TextAlign.center, style: AppTextStyles.caption),
        ),
      ],
    );
  }
}