// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ready_job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReadyJobModel _$ReadyJobModelFromJson(Map<String, dynamic> json) =>
    _ReadyJobModel(
      id: (json['id'] as num).toInt(),
      jobNumber: json['job_number'] as String?,
      customerName: json['customer_name'] as String?,
      vehicleNumber: json['vehicle_number'] as String?,
      serviceType: json['service_type'] as String?,
      customerPhone: json['customer_phone'] as String?,
    );

Map<String, dynamic> _$ReadyJobModelToJson(_ReadyJobModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'job_number': instance.jobNumber,
      'customer_name': instance.customerName,
      'vehicle_number': instance.vehicleNumber,
      'service_type': instance.serviceType,
      'customer_phone': instance.customerPhone,
    };
