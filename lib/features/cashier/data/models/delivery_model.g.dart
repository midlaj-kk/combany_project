// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryModel _$DeliveryModelFromJson(Map<String, dynamic> json) =>
    _DeliveryModel(
      id: (json['id'] as num).toInt(),
      deliveryDate: json['delivery_date'] as String?,
      customerReceived: json['customer_received'] as bool?,
      remarks: json['remarks'] as String?,
      serviceJob: (json['service_job'] as num).toInt(),
      deliveredBy: (json['delivered_by'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$DeliveryModelToJson(_DeliveryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'delivery_date': instance.deliveryDate,
      'customer_received': instance.customerReceived,
      'remarks': instance.remarks,
      'service_job': instance.serviceJob,
      'delivered_by': instance.deliveredBy,
      'created_at': instance.createdAt,
    };

_DeliveryCreateRequest _$DeliveryCreateRequestFromJson(
  Map<String, dynamic> json,
) => _DeliveryCreateRequest(
  deliveryDate: json['delivery_date'] as String,
  customerReceived: json['customer_received'] as bool?,
  remarks: json['remarks'] as String?,
  serviceJob: (json['service_job'] as num).toInt(),
);

Map<String, dynamic> _$DeliveryCreateRequestToJson(
  _DeliveryCreateRequest instance,
) => <String, dynamic>{
  'delivery_date': instance.deliveryDate,
  'customer_received': instance.customerReceived,
  'remarks': instance.remarks,
  'service_job': instance.serviceJob,
};

_PaginatedDeliveryList _$PaginatedDeliveryListFromJson(
  Map<String, dynamic> json,
) => _PaginatedDeliveryList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => DeliveryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedDeliveryListToJson(
  _PaginatedDeliveryList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
