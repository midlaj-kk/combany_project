
enum PaymentStatusEnum {
  pending,
  paid,
  partial;

  factory PaymentStatusEnum.fromString(String value) {
    return switch (value) {
      'pending' => PaymentStatusEnum.pending,
      'paid' => PaymentStatusEnum.paid,
      'partial' => PaymentStatusEnum.partial,
      _ => throw ArgumentError('Unknown PaymentStatusEnum: $value'),
    };
  }

  String toJson() => name;
}

class BillModel {
  final int id;
  final String? jobNumber;
  final String? invoiceNumber;
  final String? labourCharge;
  final String? partsCharge;
  final String? tax;
  final String? discount;
  final String? totalAmount;
  final String? amountPaid;
  final PaymentStatusEnum? paymentStatus;
  final int serviceJob;
  final String? customerName;
  final String? vehicleNumber;
  final int? createdBy;
  final String? createdAt;
  final String? updatedAt;

  const BillModel({
    required this.id,
    this.jobNumber,
    this.invoiceNumber,
    this.labourCharge,
    this.partsCharge,
    this.tax,
    this.discount,
    this.totalAmount,
    this.amountPaid,
    this.paymentStatus,
    required this.serviceJob,
    this.customerName,
    this.vehicleNumber,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory BillModel.fromJson(Map<String, dynamic> json) {
    return BillModel(
      id: json['id'] as int,
      jobNumber: json['job_number'] as String?,
      invoiceNumber: json['invoice_number'] as String?,
      labourCharge: json['labour_charge'] as String?,
      partsCharge: json['parts_charge'] as String?,
      tax: json['tax'] as String?,
      discount: json['discount'] as String?,
      totalAmount: json['total_amount'] as String?,
      amountPaid: json['amount_paid'] as String?,
      paymentStatus: json['payment_status'] != null
          ? PaymentStatusEnum.fromString(json['payment_status'] as String)
          : null,
      serviceJob: json['service_job'] as int,
      customerName: json['customer_name'] as String?,
      vehicleNumber: json['vehicle_number'] as String?,
      createdBy: json['created_by'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

class BillCreateRequest {
  final int serviceJob;
  final String labourCharge;
  final String partsCharge;
  final String? tax;
  final String? discount;

  const BillCreateRequest({
    required this.serviceJob,
    required this.labourCharge,
    required this.partsCharge,
    this.tax,
    this.discount,
  });

  factory BillCreateRequest.fromJson(Map<String, dynamic> json) {
    return BillCreateRequest(
      serviceJob: json['service_job'] as int,
      labourCharge: json['labour_charge'] as String,
      partsCharge: json['parts_charge'] as String,
      tax: json['tax'] as String?,
      discount: json['discount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service_job': serviceJob,
      'labour_charge': labourCharge,
      'parts_charge': partsCharge,
      'tax': tax,
      'discount': discount,
    };
  }
}

class PaginatedBillList {
  final int count;
  final String? next;
  final String? previous;
  final List<BillModel> results;

  const PaginatedBillList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedBillList.fromJson(Map<String, dynamic> json) {
    return PaginatedBillList(
      count: json['count'] as int? ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>? ?? [])
          .map((e) => BillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
