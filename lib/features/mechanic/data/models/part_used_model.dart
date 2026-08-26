import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_used_model.freezed.dart';
part 'part_used_model.g.dart';

@freezed
abstract class PartUsedModel with _$PartUsedModel {
  const factory PartUsedModel({
    required int id,
    @JsonKey(name: 'service_job') required int serviceJob,
    required int part,
    @JsonKey(name: 'part_name') String? partName,
    @JsonKey(name: 'part_number') String? partNumber,
    required String quantity,
    String? price,
    @JsonKey(name: 'added_by') int? addedBy,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _PartUsedModel;

  factory PartUsedModel.fromJson(Map<String, dynamic> json) =>
      _$PartUsedModelFromJson(json);
}

@freezed
abstract class PartUsedCreateRequest with _$PartUsedCreateRequest {
  const factory PartUsedCreateRequest({
    @JsonKey(name: 'service_job') required int serviceJob,
    required int part,
    required String quantity,
  }) = _PartUsedCreateRequest;

  factory PartUsedCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$PartUsedCreateRequestFromJson(json);
}

@freezed
abstract class PaginatedPartUsedList with _$PaginatedPartUsedList {
  const factory PaginatedPartUsedList({
    required int count,
    String? next,
    String? previous,
    required List<PartUsedModel> results,
  }) = _PaginatedPartUsedList;

  factory PaginatedPartUsedList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedPartUsedListFromJson(json);
}
