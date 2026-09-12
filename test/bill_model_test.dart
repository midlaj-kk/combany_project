import 'package:flutter_test/flutter_test.dart';

import 'package:auto_care_app/features/cashier/models/bill_model.dart';

void main() {
  group('BillModel.fromJson', () {
    test('parses amount_paid arriving as a double (the deployed crash case)', () {
      final bill = BillModel.fromJson({
        'id': 2,
        'job_number': 'SJ-2026-00043',
        'invoice_number': 'INV-2026-00002',
        'labour_charge': '600.00',
        'parts_charge': '0.00',
        'tax': '108.00',
        'discount': null,
        'total_amount': '708.00',
        // Real backend sends this as 0.0 (JSON number, not string).
        'amount_paid': 0.0,
        'payment_status': 'pending',
        'service_job': 43,
        'customer_name': 'Test Customer',
        'vehicle_number': 'KL 01 AB 1234',
      });

      expect(bill.id, 2);
      expect(bill.jobNumber, 'SJ-2026-00043');
      expect(bill.invoiceNumber, 'INV-2026-00002');
      expect(bill.labourCharge, '600.00');
      expect(bill.partsCharge, '0.00');
      expect(bill.totalAmount, '708.00');
      expect(bill.amountPaid, '0.0');
      expect(bill.paymentStatus, PaymentStatusEnum.pending);
      expect(bill.serviceJob, 43);
    });

    test('parses amount_paid arriving as a string', () {
      final bill = BillModel.fromJson({
        'id': 2,
        'amount_paid': '300.00',
        'payment_status': 'partial',
        'service_job': 43,
        'total_amount': '708.00',
      });

      expect(bill.amountPaid, '300.00');
      expect(bill.paymentStatus, PaymentStatusEnum.partial);
    });

    test('handles amount fields being absent', () {
      final bill = BillModel.fromJson({
        'id': 2,
        'service_job': 43,
      });

      expect(bill.amountPaid, isNull);
      expect(bill.totalAmount, isNull);
      expect(bill.paymentStatus, isNull);
    });
  });

  test('PaginatedBillList.fromJson maps a full response envelope', () {
    final page = PaginatedBillList.fromJson({
      'count': 1,
      'next': null,
      'previous': null,
      'results': [
        {
          'id': 2,
          'job_number': 'SJ-2026-00043',
          'invoice_number': 'INV-2026-00002',
          'labour_charge': '600.00',
          'parts_charge': '0.00',
          'tax': '108.00',
          'discount': null,
          'total_amount': '708.00',
          'amount_paid': 0.0,
          'payment_status': 'pending',
          'service_job': 43,
          'customer_name': 'Test Customer',
          'vehicle_number': 'KL 01 AB 1234',
        },
      ],
    });

    expect(page.count, 1);
    expect(page.results, hasLength(1));
    expect(page.results.first.amountPaid, '0.0');
    expect(page.results.first.customerName, 'Test Customer');
  });
}