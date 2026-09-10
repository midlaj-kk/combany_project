
class ReadyJobModel {
  final int id;
  final String? jobNumber;
  final String? customerName;
  final String? vehicleNumber;
  final String? vehicleModel;
  final String? serviceType;
  final String? customerPhone;

  const ReadyJobModel({
    required this.id,
    this.jobNumber,
    this.customerName,
    this.vehicleNumber,
    this.vehicleModel,
    this.serviceType,
    this.customerPhone,
  });

  factory ReadyJobModel.fromJson(Map<String, dynamic> json) {
    return ReadyJobModel(
      id: json['id'] as int,
      jobNumber: json['job_number'] as String?,
      customerName: json['customer_name'] as String?,
      vehicleNumber: json['vehicle_number'] as String?,
      vehicleModel: json['vehicle_model'] as String?,
      serviceType: json['service_type'] as String?,
      customerPhone: json['customer_phone'] as String?,
    );
  }
}
