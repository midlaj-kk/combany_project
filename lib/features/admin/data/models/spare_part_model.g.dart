// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spare_part_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SparePartModel _$SparePartModelFromJson(Map<String, dynamic> json) =>
    _SparePartModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      partNumber: json['part_number'] as String,
      stockQuantity: json['stock_quantity'] as String?,
      unit: json['unit'] as String?,
      purchasePrice: json['purchase_price'] as String?,
      sellingPrice: json['selling_price'] as String?,
      minimumStock: json['minimum_stock'] as String?,
      status: $enumDecodeNullable(_$SparePartStatusEnumMap, json['status']),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$SparePartModelToJson(_SparePartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'part_number': instance.partNumber,
      'stock_quantity': instance.stockQuantity,
      'unit': instance.unit,
      'purchase_price': instance.purchasePrice,
      'selling_price': instance.sellingPrice,
      'minimum_stock': instance.minimumStock,
      'status': _$SparePartStatusEnumMap[instance.status],
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$SparePartStatusEnumMap = {
  SparePartStatus.active: 'active',
  SparePartStatus.inactive: 'inactive',
};

_SparePartCreateRequest _$SparePartCreateRequestFromJson(
  Map<String, dynamic> json,
) => _SparePartCreateRequest(
  name: json['name'] as String,
  partNumber: json['part_number'] as String,
  stockQuantity: json['stock_quantity'] as String?,
  unit: json['unit'] as String?,
  purchasePrice: json['purchase_price'] as String,
  sellingPrice: json['selling_price'] as String,
  minimumStock: json['minimum_stock'] as String?,
);

Map<String, dynamic> _$SparePartCreateRequestToJson(
  _SparePartCreateRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'part_number': instance.partNumber,
  'stock_quantity': instance.stockQuantity,
  'unit': instance.unit,
  'purchase_price': instance.purchasePrice,
  'selling_price': instance.sellingPrice,
  'minimum_stock': instance.minimumStock,
};

_PaginatedSparePartList _$PaginatedSparePartListFromJson(
  Map<String, dynamic> json,
) => _PaginatedSparePartList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => SparePartModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedSparePartListToJson(
  _PaginatedSparePartList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};

_StockMovementModel _$StockMovementModelFromJson(Map<String, dynamic> json) =>
    _StockMovementModel(
      id: (json['id'] as num).toInt(),
      sparePart: (json['spare_part'] as num?)?.toInt(),
      quantity: json['quantity'] as String,
      movementType: json['movementType'] as String,
      reference: json['reference'] as String?,
      createdBy: (json['created_by'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$StockMovementModelToJson(_StockMovementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'spare_part': instance.sparePart,
      'quantity': instance.quantity,
      'movementType': instance.movementType,
      'reference': instance.reference,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
    };
