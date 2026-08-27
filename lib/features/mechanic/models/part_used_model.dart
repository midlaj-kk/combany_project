
class PartUsedModel {
  final int id;
  final int serviceJob;
  final int part;
  final String? partName;
  final String? partNumber;
  final String quantity;
  final String? price;
  final int? addedBy;
  final String? createdAt;
  final String? updatedAt;

  const PartUsedModel({
    required this.id,
    required this.serviceJob,
    required this.part,
    this.partName,
    this.partNumber,
    required this.quantity,
    this.price,
    this.addedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory PartUsedModel.fromJson(Map<String, dynamic> json) {
    return PartUsedModel(
      id: json['id'] as int,
      serviceJob: json['service_job'] as int,
      part: json['part'] as int,
      partName: json['part_name'] as String?,
      partNumber: json['part_number'] as String?,
      quantity: json['quantity'] as String,
      price: json['price'] as String?,
      addedBy: json['added_by'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

class PartUsedCreateRequest {
  final int serviceJob;
  final int part;
  final String quantity;

  const PartUsedCreateRequest({
    required this.serviceJob,
    required this.part,
    required this.quantity,
  });

  factory PartUsedCreateRequest.fromJson(Map<String, dynamic> json) {
    return PartUsedCreateRequest(
      serviceJob: json['service_job'] as int,
      part: json['part'] as int,
      quantity: json['quantity'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service_job': serviceJob,
      'part_id': part,
      'quantity': quantity,
    };
  }
}

class PaginatedPartUsedList {
  final int count;
  final String? next;
  final String? previous;
  final List<PartUsedModel> results;

  const PaginatedPartUsedList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedPartUsedList.fromJson(Map<String, dynamic> json) {
    return PaginatedPartUsedList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => PartUsedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
