
class DeliveryModel {
  final int id;
  final String? deliveryDate;
  final bool? customerReceived;
  final String? remarks;
  final int serviceJob;
  final int? deliveredBy;
  final String? createdAt;

  const DeliveryModel({
    required this.id,
    this.deliveryDate,
    this.customerReceived,
    this.remarks,
    required this.serviceJob,
    this.deliveredBy,
    this.createdAt,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      id: json['id'] as int,
      deliveryDate: json['delivery_date'] as String?,
      customerReceived: json['customer_received'] as bool?,
      remarks: json['remarks'] as String?,
      serviceJob: json['service_job'] as int,
      deliveredBy: json['delivered_by'] as int?,
      createdAt: json['created_at'] as String?,
    );
  }
}

class DeliveryCreateRequest {
  final String deliveryDate;
  final bool? customerReceived;
  final String? remarks;
  final int serviceJob;

  const DeliveryCreateRequest({
    required this.deliveryDate,
    this.customerReceived,
    this.remarks,
    required this.serviceJob,
  });

  factory DeliveryCreateRequest.fromJson(Map<String, dynamic> json) {
    return DeliveryCreateRequest(
      deliveryDate: json['delivery_date'] as String,
      customerReceived: json['customer_received'] as bool?,
      remarks: json['remarks'] as String?,
      serviceJob: json['service_job'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'delivery_date': deliveryDate,
      'customer_received': customerReceived,
      'remarks': remarks,
      'service_job': serviceJob,
    };
  }
}

class PaginatedDeliveryList {
  final int count;
  final String? next;
  final String? previous;
  final List<DeliveryModel> results;

  const PaginatedDeliveryList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedDeliveryList.fromJson(Map<String, dynamic> json) {
    return PaginatedDeliveryList(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => DeliveryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
