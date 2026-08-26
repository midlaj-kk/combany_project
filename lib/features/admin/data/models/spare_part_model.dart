import 'package:freezed_annotation/freezed_annotation.dart';

part 'spare_part_model.freezed.dart';
part 'spare_part_model.g.dart';

enum SparePartStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
}

@freezed
abstract class SparePartModel with _$SparePartModel {
  const factory SparePartModel({
    required int id,
    required String name,
    @JsonKey(name: 'part_number') required String partNumber,
    @JsonKey(name: 'stock_quantity') String? stockQuantity,
    String? unit,
    @JsonKey(name: 'purchase_price') String? purchasePrice,
    @JsonKey(name: 'selling_price') String? sellingPrice,
    @JsonKey(name: 'minimum_stock') String? minimumStock,
    SparePartStatus? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _SparePartModel;

  factory SparePartModel.fromJson(Map<String, dynamic> json) =>
      _$SparePartModelFromJson(json);
}

@freezed
abstract class SparePartCreateRequest with _$SparePartCreateRequest {
  const factory SparePartCreateRequest({
    required String name,
    @JsonKey(name: 'part_number') required String partNumber,
    @JsonKey(name: 'stock_quantity') String? stockQuantity,
    String? unit,
    @JsonKey(name: 'purchase_price') required String purchasePrice,
    @JsonKey(name: 'selling_price') required String sellingPrice,
    @JsonKey(name: 'minimum_stock') String? minimumStock,
  }) = _SparePartCreateRequest;

  factory SparePartCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$SparePartCreateRequestFromJson(json);
}

@freezed
abstract class PaginatedSparePartList with _$PaginatedSparePartList {
  const factory PaginatedSparePartList({
    required int count,
    String? next,
    String? previous,
    required List<SparePartModel> results,
  }) = _PaginatedSparePartList;

  factory PaginatedSparePartList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedSparePartListFromJson(json);
}

@freezed
abstract class StockMovementModel with _$StockMovementModel {
  const factory StockMovementModel({
    required int id,
    @JsonKey(name: 'spare_part') int? sparePart,
    required String quantity,
    required String movementType,
    String? reference,
    @JsonKey(name: 'created_by') int? createdBy,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _StockMovementModel;

  factory StockMovementModel.fromJson(Map<String, dynamic> json) =>
      _$StockMovementModelFromJson(json);
}
