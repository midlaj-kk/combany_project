import 'package:dio/dio.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/bill_model.dart';
import '../models/payment_model.dart';
import '../models/delivery_model.dart';
import '../models/ready_job_model.dart';

class CashierService {
  final Dio dio;
  CashierService({required this.dio});

  // ── Bills ────────────────────────────────────────────────────────────────
  Future<PaginatedBillList> getBills({String? paymentStatus, int? page, int? pageSize}) async {
    final response = await dio.get(
      ApiEndpoints.bills,
      queryParameters: {
        if (paymentStatus != null && paymentStatus.isNotEmpty) 'payment_status': paymentStatus,
        if (page != null) 'page': page,
        if (pageSize != null) 'page_size': pageSize,
      },
    );
    return PaginatedBillList.fromJson(response.data as Map<String, dynamic>);
  }

  Future<BillModel> getBill(int id) async {
    final response = await dio.get(ApiEndpoints.billById(id));
    return BillModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<BillModel> createBill(BillCreateRequest request) async {
    final response = await dio.post(
      ApiEndpoints.bills,
      data: request.toJson(),
    );
    return BillModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<BillModel> updateBill(int id, Map<String, dynamic> data) async {
    final response = await dio.patch(ApiEndpoints.billById(id), data: data);
    return BillModel.fromJson(response.data as Map<String, dynamic>);
  }

  // ── Payments ─────────────────────────────────────────────────────────────
  Future<PaymentModel> createPayment(PaymentCreateRequest request) async {
    final response = await dio.post(
      ApiEndpoints.payments,
      data: request.toJson(),
    );
    return PaymentModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<PaginatedPaymentList> getPayments({int? page, int? pageSize}) async {
    final response = await dio.get(
      ApiEndpoints.payments,
      queryParameters: {
        if (page != null) 'page': page,
        if (pageSize != null) 'page_size': pageSize,
      },
    );
    return PaginatedPaymentList.fromJson(response.data as Map<String, dynamic>);
  }

  // ── Deliveries ───────────────────────────────────────────────────────────
  Future<DeliveryModel> createDelivery(DeliveryCreateRequest request) async {
    final response = await dio.post(
      ApiEndpoints.deliveries,
      data: request.toJson(),
    );
    return DeliveryModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<ReadyJobModel>> getReadyDeliveries() async {
    final response = await dio.get(ApiEndpoints.readyForDelivery);
    final data = response.data;
    if (data is List) {
      return data.map((e) => ReadyJobModel.fromJson(e as Map<String, dynamic>)).toList();
    }
    return (data['results'] as List)
        .map((e) => ReadyJobModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<DeliveryModel>> getDeliveredItems() async {
    final response = await dio.get(ApiEndpoints.delivered);
    final data = response.data;
    if (data is List) {
      return data.map((e) => DeliveryModel.fromJson(e as Map<String, dynamic>)).toList();
    }
    return (data['results'] as List)
        .map((e) => DeliveryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
