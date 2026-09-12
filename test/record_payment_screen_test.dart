import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:auto_care_app/features/cashier/bloc/bloc.dart';
import 'package:auto_care_app/features/cashier/models/bill_model.dart';
import 'package:auto_care_app/features/cashier/models/payment_model.dart';
import 'package:auto_care_app/features/cashier/screens/record_payment_screen.dart';
import 'package:auto_care_app/features/cashier/services/cashier_service.dart';

class _FakeCashierService extends CashierService {
  _FakeCashierService() : super(dio: Dio());

  @override
  Future<BillModel> getBill(int id) async {
    return BillModel.fromJson({
      'id': id,
      'job_number': 'SJ-10',
      'invoice_number': 'INV-100',
      'customer_name': 'Aashique',
      'vehicle_number': 'KL 01 AB 1001',
      'total_amount': '708.00',
      'amount_paid': 0.0,
      'payment_status': 'pending',
      'service_job': 43,
    });
  }

  @override
  Future<PaymentModel> createPayment(PaymentCreateRequest request) async {
    return PaymentModel(
      id: 0,
      paymentMethod: request.paymentMethod,
      paidAmount: request.paidAmount,
      paymentDate: request.paymentDate,
      razorpayPaymentId: request.razorpayPaymentId,
      bill: request.bill,
      razorpayOrder: request.razorpayOrder,
    );
  }
}

void main() {
  Future<void> pumpScreen(WidgetTester tester) async {
    final bloc = BillingBloc(service: _FakeCashierService());
    addTearDown(bloc.close);
    await tester.pumpWidget(
      BlocProvider<BillingBloc>.value(
        value: bloc,
        child: const MaterialApp(
          home: RecordPaymentScreen(billId: 5),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('RecordPaymentScreen renders bill without exceptions',
      (tester) async {
    await pumpScreen(tester);

    expect(tester.takeException(), isNull);
    expect(find.text('Record Payment'), findsWidgets);
    expect(find.text('INV-100'), findsOneWidget);
  });

  testWidgets('Recording a payment navigates to the success screen',
      (tester) async {
    await pumpScreen(tester);

    await tester.tap(find.text('Pay Full Amount'));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Confirm Payment'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Confirm Payment'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('Payment Recorded'), findsOneWidget);
  });
}