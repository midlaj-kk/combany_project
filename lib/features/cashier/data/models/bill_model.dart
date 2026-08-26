import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_model.freezed.dart';
part 'bill_model.g.dart';

enum PaymentStatusEnum {
  @JsonValue('pending')
  pending,
  @JsonValue('paid')
  paid,
  @JsonValue('partial')
  partial,
}

@freezed
abstract class BillModel with _$BillModel {
  const factory BillModel({
    required int id,
    @JsonKey(name: 'job_number') String? jobNumber,
    @JsonKey(name: 'invoice_number') String? invoiceNumber,
    @JsonKey(name: 'labour_charge') String? labourCharge,
    @JsonKey(name: 'parts_charge') String? partsCharge,
    String? tax,
    String? discount,
    @JsonKey(name: 'total_amount') String? totalAmount,
    @JsonKey(name: 'amount_paid') String? amountPaid,
    @JsonKey(name: 'payment_status') PaymentStatusEnum? paymentStatus,
    @JsonKey(name: 'service_job') required int serviceJob,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'vehicle_number') String? vehicleNumber,
    @JsonKey(name: 'created_by') int? createdBy,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _BillModel;

  factory BillModel.fromJson(Map<String, dynamic> json) =>
      _$BillModelFromJson(json);
}

@freezed
abstract class BillCreateRequest with _$BillCreateRequest {
  const factory BillCreateRequest({
    @JsonKey(name: 'service_job') required int serviceJob,
    @JsonKey(name: 'labour_charge') required String labourCharge,
    @JsonKey(name: 'parts_charge') required String partsCharge,
    String? tax,
    String? discount,
  }) = _BillCreateRequest;

  factory BillCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$BillCreateRequestFromJson(json);
}

@freezed
abstract class PaginatedBillList with _$PaginatedBillList {
  const factory PaginatedBillList({
    required int count,
    String? next,
    String? previous,
    required List<BillModel> results,
  }) = _PaginatedBillList;

  factory PaginatedBillList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedBillListFromJson(json);
}
