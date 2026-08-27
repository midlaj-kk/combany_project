import 'package:dio/dio.dart';
import '../../../core/constants/api_endpoints.dart';
import '../models/bill_model.dart';
import '../models/payment_model.dart';
import '../models/delivery_model.dart';
import '../models/ready_job_model.dart';

class CashierService {
  final Dio dio;

  CashierService({required this.dio});

  // ── Bills ────────────────────────────────────────────────────────────────

  Future<PaginatedBillList> getBills({String? paymentStatus, int? page, int? pageSize}) async {
    try {
      final response = await dio.get(
        ApiEndpoints.bills,
        queryParameters: {
          if (paymentStatus != null && paymentStatus.isNotEmpty)
            'payment_status': paymentStatus,
          if (page != null) 'page': page,
          if (pageSize != null) 'page_size': pageSize,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List) {
          return PaginatedBillList(
            count: data.length,
            results: data
                .map((e) => BillModel.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
        }
        return PaginatedBillList.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load bills (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<BillModel> getBill(int id) async {
    try {
      final response = await dio.get(ApiEndpoints.billById(id));

      if (response.statusCode == 200) {
        return BillModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load bill (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<BillModel> createBill(BillCreateRequest request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.bills,
        data: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return BillModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to create bill (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<BillModel> updateBill(int id, Map<String, dynamic> data) async {
    try {
      final response = await dio.patch(ApiEndpoints.billById(id), data: data);

      if (response.statusCode == 200) {
        return BillModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to update bill (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Payments ─────────────────────────────────────────────────────────────

  Future<PaymentModel> createPayment(PaymentCreateRequest request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.payments,
        data: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return PaymentModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to create payment (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<PaginatedPaymentList> getPayments({int? page, int? pageSize}) async {
    try {
      final response = await dio.get(
        ApiEndpoints.payments,
        queryParameters: {
          if (page != null) 'page': page,
          if (pageSize != null) 'page_size': pageSize,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List) {
          return PaginatedPaymentList(
            count: data.length,
            results: data
                .map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
        }
        return PaginatedPaymentList.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load payments (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Deliveries ───────────────────────────────────────────────────────────

  Future<DeliveryModel> createDelivery(DeliveryCreateRequest request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.deliveries,
        data: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return DeliveryModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to create delivery (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<List<ReadyJobModel>> getReadyDeliveries() async {
    try {
      final response = await dio.get(ApiEndpoints.readyForDelivery);

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List) {
          return data
              .map((e) => ReadyJobModel.fromJson(e as Map<String, dynamic>))
              .toList();
        }
        final results = data['results'];
        if (results == null || results is! List) return [];
        return results
            .map((e) => ReadyJobModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load ready deliveries (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<List<DeliveryModel>> getDeliveredItems() async {
    try {
      final response = await dio.get(ApiEndpoints.delivered);

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List) {
          return data
              .map((e) => DeliveryModel.fromJson(e as Map<String, dynamic>))
              .toList();
        }
        final results = data['results'];
        if (results == null || results is! List) return [];
        return results
            .map((e) => DeliveryModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load delivered items (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Helper ───────────────────────────────────────────────────────────────

  String _getErrorMessage(DioException e) {
    if (e.response != null) {
      final statusCode = e.response?.statusCode;
      final data = e.response?.data;

      if (data is Map && data.containsKey('detail')) {
        return data['detail'].toString();
      }
      if (data is Map && data.containsKey('message')) {
        return data['message'].toString();
      }
      return 'Server error ($statusCode). Please try again.';
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return 'Connection timed out. Please check your internet.';
    }

    if (e.type == DioExceptionType.connectionError) {
      return 'No internet connection. Please try again.';
    }

    return 'Something went wrong. Please try again.';
  }
}
