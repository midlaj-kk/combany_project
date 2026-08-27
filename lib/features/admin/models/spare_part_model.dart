enum SparePartStatus {
  active,
  inactive,
}

SparePartStatus _parseSparePartStatus(String value) {
  switch (value) {
    case 'active':
      return SparePartStatus.active;
    case 'inactive':
      return SparePartStatus.inactive;
    default:
      return SparePartStatus.active;
  }
}

class SparePartModel {
  final int id;
  final String name;
  final String partNumber;
  final String? stockQuantity;
  final String? unit;
  final String? purchasePrice;
  final String? sellingPrice;
  final String? minimumStock;
  final SparePartStatus? status;
  final String? createdAt;
  final String? updatedAt;

  SparePartModel({
    required this.id,
    required this.name,
    required this.partNumber,
    this.stockQuantity,
    this.unit,
    this.purchasePrice,
    this.sellingPrice,
    this.minimumStock,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory SparePartModel.fromJson(Map<String, dynamic> json) {
    return SparePartModel(
      id: json['id'] as int,
      name: json['name'] as String,
      partNumber: json['part_number'] as String,
      stockQuantity: json['stock_quantity'] as String?,
      unit: json['unit'] as String?,
      purchasePrice: json['purchase_price'] as String?,
      sellingPrice: json['selling_price'] as String?,
      minimumStock: json['minimum_stock'] as String?,
      status: json['status'] != null
          ? _parseSparePartStatus(json['status'] as String)
          : null,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

class SparePartCreateRequest {
  final String name;
  final String partNumber;
  final String? stockQuantity;
  final String? unit;
  final String purchasePrice;
  final String sellingPrice;
  final String? minimumStock;

  SparePartCreateRequest({
    required this.name,
    required this.partNumber,
    this.stockQuantity,
    this.unit,
    required this.purchasePrice,
    required this.sellingPrice,
    this.minimumStock,
  });

  factory SparePartCreateRequest.fromJson(Map<String, dynamic> json) {
    return SparePartCreateRequest(
      name: json['name'] as String,
      partNumber: json['part_number'] as String,
      stockQuantity: json['stock_quantity'] as String?,
      unit: json['unit'] as String?,
      purchasePrice: json['purchase_price'] as String,
      sellingPrice: json['selling_price'] as String,
      minimumStock: json['minimum_stock'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'part_number': partNumber,
      'stock_quantity': stockQuantity,
      'unit': unit,
      'purchase_price': purchasePrice,
      'selling_price': sellingPrice,
      'minimum_stock': minimumStock,
    };
  }
}

class PaginatedSparePartList {
  final int count;
  final String? next;
  final String? previous;
  final List<SparePartModel> results;

  PaginatedSparePartList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedSparePartList.fromJson(Map<String, dynamic> json) {
    return PaginatedSparePartList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List)
          .map((e) => SparePartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class StockMovementModel {
  final int id;
  final int? sparePart;
  final String quantity;
  final String movementType;
  final String? reference;
  final int? createdBy;
  final String? createdAt;

  StockMovementModel({
    required this.id,
    this.sparePart,
    required this.quantity,
    required this.movementType,
    this.reference,
    this.createdBy,
    this.createdAt,
  });

  factory StockMovementModel.fromJson(Map<String, dynamic> json) {
    return StockMovementModel(
      id: json['id'] as int,
      sparePart: json['spare_part'] as int?,
      quantity: json['quantity'] as String,
      movementType: json['movement_type'] as String,
      reference: json['reference'] as String?,
      createdBy: json['created_by'] as int?,
      createdAt: json['created_at'] as String?,
    );
  }
}
