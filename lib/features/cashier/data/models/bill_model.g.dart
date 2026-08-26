// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BillModel _$BillModelFromJson(Map<String, dynamic> json) => _BillModel(
  id: (json['id'] as num).toInt(),
  jobNumber: json['job_number'] as String?,
  invoiceNumber: json['invoice_number'] as String?,
  labourCharge: json['labour_charge'] as String?,
  partsCharge: json['parts_charge'] as String?,
  tax: json['tax'] as String?,
  discount: json['discount'] as String?,
  totalAmount: json['total_amount'] as String?,
  amountPaid: json['amount_paid'] as String?,
  paymentStatus: $enumDecodeNullable(
    _$PaymentStatusEnumEnumMap,
    json['payment_status'],
  ),
  serviceJob: (json['service_job'] as num).toInt(),
  customerName: json['customer_name'] as String?,
  vehicleNumber: json['vehicle_number'] as String?,
  createdBy: (json['created_by'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$BillModelToJson(_BillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'job_number': instance.jobNumber,
      'invoice_number': instance.invoiceNumber,
      'labour_charge': instance.labourCharge,
      'parts_charge': instance.partsCharge,
      'tax': instance.tax,
      'discount': instance.discount,
      'total_amount': instance.totalAmount,
      'amount_paid': instance.amountPaid,
      'payment_status': _$PaymentStatusEnumEnumMap[instance.paymentStatus],
      'service_job': instance.serviceJob,
      'customer_name': instance.customerName,
      'vehicle_number': instance.vehicleNumber,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$PaymentStatusEnumEnumMap = {
  PaymentStatusEnum.pending: 'pending',
  PaymentStatusEnum.paid: 'paid',
  PaymentStatusEnum.partial: 'partial',
};

_BillCreateRequest _$BillCreateRequestFromJson(Map<String, dynamic> json) =>
    _BillCreateRequest(
      serviceJob: (json['service_job'] as num).toInt(),
      labourCharge: json['labour_charge'] as String,
      partsCharge: json['parts_charge'] as String,
      tax: json['tax'] as String?,
      discount: json['discount'] as String?,
    );

Map<String, dynamic> _$BillCreateRequestToJson(_BillCreateRequest instance) =>
    <String, dynamic>{
      'service_job': instance.serviceJob,
      'labour_charge': instance.labourCharge,
      'parts_charge': instance.partsCharge,
      'tax': instance.tax,
      'discount': instance.discount,
    };

_PaginatedBillList _$PaginatedBillListFromJson(Map<String, dynamic> json) =>
    _PaginatedBillList(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => BillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedBillListToJson(_PaginatedBillList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
