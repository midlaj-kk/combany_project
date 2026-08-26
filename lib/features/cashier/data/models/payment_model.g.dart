// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) =>
    _PaymentModel(
      id: (json['id'] as num).toInt(),
      paymentMethod: $enumDecodeNullable(
        _$PaymentMethodEnumMap,
        json['payment_method'],
      ),
      paidAmount: json['paid_amount'] as String?,
      paymentDate: json['payment_date'] as String?,
      razorpayPaymentId: json['razorpay_payment_id'] as String?,
      createdAt: json['created_at'] as String?,
      bill: (json['bill'] as num).toInt(),
      receivedBy: (json['received_by'] as num?)?.toInt(),
      razorpayOrder: (json['razorpay_order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaymentModelToJson(_PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment_method': _$PaymentMethodEnumMap[instance.paymentMethod],
      'paid_amount': instance.paidAmount,
      'payment_date': instance.paymentDate,
      'razorpay_payment_id': instance.razorpayPaymentId,
      'created_at': instance.createdAt,
      'bill': instance.bill,
      'received_by': instance.receivedBy,
      'razorpay_order': instance.razorpayOrder,
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.upi: 'upi',
  PaymentMethod.card: 'card',
  PaymentMethod.bankTransfer: 'bank_transfer',
  PaymentMethod.online: 'online',
};

_PaymentCreateRequest _$PaymentCreateRequestFromJson(
  Map<String, dynamic> json,
) => _PaymentCreateRequest(
  paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['payment_method']),
  paidAmount: json['paid_amount'] as String,
  paymentDate: json['payment_date'] as String,
  razorpayPaymentId: json['razorpay_payment_id'] as String?,
  bill: (json['bill'] as num).toInt(),
  razorpayOrder: (json['razorpay_order'] as num?)?.toInt(),
);

Map<String, dynamic> _$PaymentCreateRequestToJson(
  _PaymentCreateRequest instance,
) => <String, dynamic>{
  'payment_method': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  'paid_amount': instance.paidAmount,
  'payment_date': instance.paymentDate,
  'razorpay_payment_id': instance.razorpayPaymentId,
  'bill': instance.bill,
  'razorpay_order': instance.razorpayOrder,
};

_PaginatedPaymentList _$PaginatedPaymentListFromJson(
  Map<String, dynamic> json,
) => _PaginatedPaymentList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedPaymentListToJson(
  _PaginatedPaymentList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
