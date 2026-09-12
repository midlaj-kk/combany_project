import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:auto_care_app/features/cashier/bloc/bloc.dart';
import 'package:auto_care_app/features/cashier/models/ready_job_model.dart';
import 'package:auto_care_app/features/cashier/screens/create_bill_screen.dart';
import 'package:auto_care_app/features/cashier/services/cashier_service.dart';
import 'package:auto_care_app/features/cashier/widgets/ready_for_billing_card.dart';

void main() {
  testWidgets('ReadyForBillingCard fits without overflow', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ReadyForBillingCard(
                  jobNumber: 'SJ-2026-00001',
                  customerName: 'Test Customer',
                  vehicleInfo: 'KL 01 AB 1234  •  Honda City',
                  onCreateBill: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // No exception means no yellow/black overflow was reported.
    expect(tester.takeException(), isNull);

    // The "Create Bill" button must be fully visible inside the card.
    final button = find.widgetWithText(ElevatedButton, 'Create Bill');
    expect(button, findsOneWidget);
    expect(
      tester.getSize(button).height,
      lessThanOrEqualTo(40),
      reason: 'Button must not exceed its fixed 40px height.',
    );
  });

  test('ReadyJobModel parses labour and parts charges from backend JSON', () {
    final job = ReadyJobModel.fromJson({
      'id': 14,
      'job_number': 'SJ-2026-00012',
      'customer_name': 'Test Customer',
      'vehicle_number': 'KL 01 AB 1234',
      'vehicle_model': 'Honda City',
      'labour_charge': 1700.0,
      'parts_charge': 300.0,
    });

    expect(job.labourCharge, 1700.0);
    expect(job.partsCharge, 300.0);
  });

  test('ReadyJobModel defaults charges to zero when fields are missing', () {
    final job = ReadyJobModel.fromJson({
      'id': 1,
      'job_number': 'SJ-1',
    });

    expect(job.labourCharge, 0);
    expect(job.partsCharge, 0);
  });

  testWidgets('CreateBillScreen prefills labour, parts, tax and total',
      (tester) async {
    final bloc = BillingBloc(service: CashierService(dio: Dio()));
    await tester.pumpWidget(
      BlocProvider<BillingBloc>.value(
        value: bloc,
        child: MaterialApp(
          home: CreateBillScreen(
            jobId: 14,
            jobNumber: 'SJ-2026-00012',
            vehicleLabel: 'KL 01 AB 1234',
            vehicleModel: 'Honda City',
            customerName: 'Test Customer',
            initialLabourCharge: 1700,
            initialPartsCharge: 300,
          ),
        ),
      ),
    );
    addTearDown(bloc.close);

    // Prefilled from the real amounts: labour 1700, parts 300, tax 18% of
    // labour = 306. Total = labour + parts + tax - discount = 2306, shown as ₹2306.
    const expectedTexts = ['1700', '300', '306', '₹2306'];
    for (final text in expectedTexts) {
      expect(find.text(text), findsOneWidget);
    }
  });
}