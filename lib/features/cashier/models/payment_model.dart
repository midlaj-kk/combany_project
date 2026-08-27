
enum PaymentMethod {
  cash,
  upi,
  card,
  bankTransfer,
  online;

  factory PaymentMethod.fromString(String value) {
    return switch (value) {
      'cash' => PaymentMethod.cash,
      'upi' => PaymentMethod.upi,
      'card' => PaymentMethod.card,
      'bank_transfer' => PaymentMethod.bankTransfer,
      'online' => PaymentMethod.online,
      _ => throw ArgumentError('Unknown PaymentMethod: $value'),
    };
  }

  String toJson() {
    return switch (this) {
      PaymentMethod.bankTransfer => 'bank_transfer',
      _ => name,
    };
  }
}

class PaymentModel {
  final int id;
  final PaymentMethod? paymentMethod;
  final String? paidAmount;
  final String? paymentDate;
  final String? razorpayPaymentId;
  final String? createdAt;
  final int bill;
  final int? receivedBy;
  final int? razorpayOrder;

  const PaymentModel({
    required this.id,
    this.paymentMethod,
    this.paidAmount,
    this.paymentDate,
    this.razorpayPaymentId,
    this.createdAt,
    required this.bill,
    this.receivedBy,
    this.razorpayOrder,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'] as int,
      paymentMethod: json['payment_method'] != null
          ? PaymentMethod.fromString(json['payment_method'] as String)
          : null,
      paidAmount: json['paid_amount'] as String?,
      paymentDate: json['payment_date'] as String?,
      razorpayPaymentId: json['razorpay_payment_id'] as String?,
      createdAt: json['created_at'] as String?,
      bill: json['bill'] as int,
      receivedBy: json['received_by'] as int?,
      razorpayOrder: json['razorpay_order'] as int?,
    );
  }
}

class PaymentCreateRequest {
  final PaymentMethod paymentMethod;
  final String paidAmount;
  final String paymentDate;
  final String? razorpayPaymentId;
  final int bill;
  final int? razorpayOrder;

  const PaymentCreateRequest({
    required this.paymentMethod,
    required this.paidAmount,
    required this.paymentDate,
    this.razorpayPaymentId,
    required this.bill,
    this.razorpayOrder,
  });

  factory PaymentCreateRequest.fromJson(Map<String, dynamic> json) {
    return PaymentCreateRequest(
      paymentMethod: PaymentMethod.fromString(json['payment_method'] as String),
      paidAmount: json['paid_amount'] as String,
      paymentDate: json['payment_date'] as String,
      razorpayPaymentId: json['razorpay_payment_id'] as String?,
      bill: json['bill'] as int,
      razorpayOrder: json['razorpay_order'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payment_method': paymentMethod.toJson(),
      'paid_amount': paidAmount,
      'payment_date': paymentDate,
      'razorpay_payment_id': razorpayPaymentId,
      'bill': bill,
      'razorpay_order': razorpayOrder,
    };
  }
}

class PaginatedPaymentList {
  final int count;
  final String? next;
  final String? previous;
  final List<PaymentModel> results;

  const PaginatedPaymentList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedPaymentList.fromJson(Map<String, dynamic> json) {
    return PaginatedPaymentList(
      count: json['count'] as int? ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>? ?? [])
          .map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
