import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

enum PaymentMethod {
  @JsonValue('cash')
  cash,
  @JsonValue('upi')
  upi,
  @JsonValue('card')
  card,
  @JsonValue('bank_transfer')
  bankTransfer,
  @JsonValue('online')
  online,
}

@freezed
abstract class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required int id,
    @JsonKey(name: 'payment_method') PaymentMethod? paymentMethod,
    @JsonKey(name: 'paid_amount') String? paidAmount,
    @JsonKey(name: 'payment_date') String? paymentDate,
    @JsonKey(name: 'razorpay_payment_id') String? razorpayPaymentId,
    @JsonKey(name: 'created_at') String? createdAt,
    required int bill,
    @JsonKey(name: 'received_by') int? receivedBy,
    @JsonKey(name: 'razorpay_order') int? razorpayOrder,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}

@freezed
abstract class PaymentCreateRequest with _$PaymentCreateRequest {
  const factory PaymentCreateRequest({
    @JsonKey(name: 'payment_method') required PaymentMethod paymentMethod,
    @JsonKey(name: 'paid_amount') required String paidAmount,
    @JsonKey(name: 'payment_date') required String paymentDate,
    @JsonKey(name: 'razorpay_payment_id') String? razorpayPaymentId,
    required int bill,
    @JsonKey(name: 'razorpay_order') int? razorpayOrder,
  }) = _PaymentCreateRequest;

  factory PaymentCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentCreateRequestFromJson(json);
}

@freezed
abstract class PaginatedPaymentList with _$PaginatedPaymentList {
  const factory PaginatedPaymentList({
    required int count,
    String? next,
    String? previous,
    required List<PaymentModel> results,
  }) = _PaginatedPaymentList;

  factory PaginatedPaymentList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedPaymentListFromJson(json);
}
