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
      final params = <String, dynamic>{};
      if (paymentStatus != null && paymentStatus.isNotEmpty) params['payment_status'] = paymentStatus;
      if (page != null) params['page'] = page;
      if (pageSize != null) params['page_size'] = pageSize;

      final response = await dio.get(ApiEndpoints.bills, queryParameters: params);

      if (response.statusCode == 200) {
        final data = _unwrap(response.data);
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
        final data = _unwrap(response.data);
        return BillModel.fromJson(data as Map<String, dynamic>);
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
        final data = _unwrap(response.data);
        if (data is Map<String, dynamic> && data.containsKey('id')) {
          return BillModel.fromJson(data);
        }
        // The backend only returns {"success": true, ...} with no data for
        // the created bill, so rebuild one from the request we just sent.
        return BillModel(
          id: 0,
          serviceJob: request.serviceJob,
          labourCharge: request.labourCharge,
          partsCharge: request.partsCharge,
          tax: request.tax,
          discount: request.discount,
        );
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
        final body = _unwrap(response.data);
        return BillModel.fromJson(body as Map<String, dynamic>);
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
        // The backend only returns {"success": true, ...} with no data,
        // so we build the payment from the request we just sent.
        return PaymentModel(
          id: 0,
          paymentMethod: request.paymentMethod,
          paidAmount: request.paidAmount,
          paymentDate: request.paymentDate,
          razorpayPaymentId: request.razorpayPaymentId,
          bill: request.bill,
          razorpayOrder: request.razorpayOrder,
        );
      } else {
        throw Exception('Failed to create payment (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<PaginatedPaymentList> getPayments({int? page, int? pageSize}) async {
    try {
      final params = <String, dynamic>{};
      if (page != null) params['page'] = page;
      if (pageSize != null) params['page_size'] = pageSize;

      final response = await dio.get(ApiEndpoints.payments, queryParameters: params);

      if (response.statusCode == 200) {
        final data = _unwrap(response.data);
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
        final data = _unwrap(response.data);
        if (data is Map<String, dynamic> && data.containsKey('id')) {
          return DeliveryModel.fromJson(data);
        }
        // The backend only returns {"success": true, ...} with no data for
        // the created delivery, so rebuild one from the request we sent.
        return DeliveryModel(
          id: 0,
          deliveryDate: request.deliveryDate,
          customerReceived: request.customerReceived,
          remarks: request.remarks,
          serviceJob: request.serviceJob,
        );
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
        final data = _unwrap(response.data);
        if (data is List) {
          return data
              .map((e) => ReadyJobModel.fromJson(e as Map<String, dynamic>))
              .toList();
        }
        return [];
      } else {
        throw Exception('Failed to load ready deliveries (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<List<ReadyJobModel>> getReadyForBillingJobs() async {
    try {
      final response = await dio.get(
        ApiEndpoints.serviceJobs,
        queryParameters: {'status': 'ready_for_bill'},
      );

      if (response.statusCode == 200) {
        final data = _unwrap(response.data);
        if (data is Map<String, dynamic> && data['results'] is List) {
          return (data['results'] as List)
              .map((e) => ReadyJobModel.fromJson(e as Map<String, dynamic>))
              .toList();
        }
        return [];
      } else {
        throw Exception('Failed to load ready-for-billing jobs (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<List<DeliveryModel>> getDeliveredItems() async {
    try {
      final response = await dio.get(ApiEndpoints.delivered);

      if (response.statusCode == 200) {
        final data = _unwrap(response.data);
        if (data is List) {
          return data
              .map((e) => DeliveryModel.fromJson(e as Map<String, dynamic>))
              .toList();
        }
        return [];
      } else {
        throw Exception('Failed to load delivered items (status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  // ── Helper ───────────────────────────────────────────────────────────────

  /// The backend wraps list/detail payloads in
  /// {"success":..,"message":..,"data":..}. Some endpoints return the object
  /// directly. This extracts the actual data in both cases.
  static dynamic _unwrap(dynamic data) {
    if (data is Map<String, dynamic> &&
        data.containsKey('success') &&
        data.containsKey('data')) {
      return data['data'];
    }
    return data;
  }

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

      switch (statusCode) {
        case 400:
          return 'Bad request. Please check your input.';
        case 401:
          return 'Unauthorized. Please login again.';
        case 403:
          return 'Access denied. You do not have permission.';
        case 404:
          return 'Resource not found.';
        case 409:
          return 'Conflict. The resource already exists.';
        case 422:
          return 'Validation error. Please check your input.';
        case 429:
          return 'Too many requests. Please try again later.';
        case 500:
          return 'Internal server error. Please try again later.';
        case 502:
          return 'Bad gateway. Please try again later.';
        case 503:
          return 'Service unavailable. Please try again later.';
        case 504:
          return 'Gateway timeout. Please try again later.';
        default:
          return 'Server error ($statusCode). Please try again.';
      }
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
