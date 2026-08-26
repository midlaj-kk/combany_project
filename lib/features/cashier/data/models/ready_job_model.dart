import 'package:freezed_annotation/freezed_annotation.dart';

part 'ready_job_model.freezed.dart';
part 'ready_job_model.g.dart';

@freezed
abstract class ReadyJobModel with _$ReadyJobModel {
  const factory ReadyJobModel({
    required int id,
    @JsonKey(name: 'job_number') String? jobNumber,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'vehicle_number') String? vehicleNumber,
    @JsonKey(name: 'service_type') String? serviceType,
    @JsonKey(name: 'customer_phone') String? customerPhone,
  }) = _ReadyJobModel;

  factory ReadyJobModel.fromJson(Map<String, dynamic> json) =>
      _$ReadyJobModelFromJson(json);
}
