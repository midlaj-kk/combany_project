import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:auto_care_app/features/cashier/bloc/bloc.dart';
import 'package:auto_care_app/features/cashier/models/bill_model.dart';
import 'package:auto_care_app/features/cashier/models/ready_job_model.dart';
import 'package:auto_care_app/features/cashier/screens/cashier_home_screen.dart';
import 'package:auto_care_app/features/cashier/services/cashier_service.dart';

class _FakeCashierService extends CashierService {
  _FakeCashierService() : super(dio: Dio());

  @override
  Future<PaginatedBillList> getBills({
    String? paymentStatus,
    int? page,
    int? pageSize,
  }) async {
    return PaginatedBillList(
      count: 3,
      next: null,
      previous: null,
      results: [
        BillModel.fromJson({
          'id': 10,
          'job_number': 'SJ-1',
          'invoice_number': 'INV-1',
          'customer_name': 'Aashique',
          'vehicle_number': 'KL 01 AB 1001',
          'total_amount': '708.00',
          'amount_paid': 0.0,
          'payment_status': 'pending',
          'service_job': 43,
        }),
        BillModel.fromJson({
          'id': 11,
          'job_number': 'SJ-2',
          'invoice_number': 'INV-2',
          'customer_name': 'Irfan',
          'vehicle_number': 'KL 02 CD 2002',
          'total_amount': '1200.00',
          'amount_paid': 300.0,
          'payment_status': 'partial',
          'service_job': 44,
        }),
        BillModel.fromJson({
          'id': 12,
          'job_number': 'SJ-3',
          'invoice_number': 'INV-3',
          'customer_name': 'Suhail',
          'vehicle_number': 'KL 03 EF 3003',
          'total_amount': '708.00',
          'amount_paid': 708.0,
          'payment_status': 'paid',
          'service_job': 45,
        }),
      ],
    );
  }

  @override
  Future<List<ReadyJobModel>> getReadyForBillingJobs() async {
    return [
      ReadyJobModel.fromJson({
        'id': 60,
        'job_number': 'SJ-60',
        'customer_name': 'Ramesh',
        'vehicle_number': 'KL 04 GH 4004',
        'vehicle_model': 'Swift',
        'service_type': 'Full Service',
        'labour_charge': 500.0,
        'parts_charge': 1200.0,
      }),
    ];
  }

  @override
  Future<List<ReadyJobModel>> getReadyDeliveries() async {
    return [
      ReadyJobModel.fromJson({
        'id': 90,
        'job_number': 'SJ-90',
        'customer_name': 'Biju',
        'vehicle_number': 'KL 05 IJ 5005',
        'service_type': 'Full Service',
      }),
    ];
  }
}

void main() {
  Future<void> pumpScreen(WidgetTester tester) async {
    final bloc = BillingBloc(service: _FakeCashierService());
    addTearDown(bloc.close);
    await tester.pumpWidget(
      BlocProvider<BillingBloc>.value(
        value: bloc,
        child: const MaterialApp(home: CashierHomeScreen()),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('CashierHomeScreen renders without exceptions', (tester) async {
    await pumpScreen(tester);

    expect(tester.takeException(), isNull);
    expect(find.text('Cashier - Home'), findsOneWidget);
    expect(find.text('READY FOR\nBILLING'), findsOneWidget);
    expect(find.text('READY FOR\nDELIVERY'), findsOneWidget);
    expect(find.text('TOTAL\nBILLS'), findsOneWidget);
    expect(find.text('Ready for Billing'), findsOneWidget);
    expect(
      find.text('Biju'),
      findsNothing,
      reason: 'Biju is only a delivery job, not shown on the home list.',
    );
  });
}