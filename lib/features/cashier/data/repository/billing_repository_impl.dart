import 'package:dio/dio.dart';
import '../../../../core/error/result.dart';
import '../../domain/repositories/billing_repository.dart';
import '../datasources/cashier_service.dart';
import '../models/bill_model.dart';
import '../models/payment_model.dart';
import '../models/delivery_model.dart';
import '../models/ready_job_model.dart';

class BillingRepositoryImpl implements BillingRepository {
  final CashierService service;
  BillingRepositoryImpl({required this.service});

  @override
  Future<Result<PaginatedBillList>> getBills({String? paymentStatus, int? page}) async {
    try {
      final result = await service.getBills(paymentStatus: paymentStatus, page: page);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load bills');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<BillModel>> getBill(int id) async {
    try {
      final result = await service.getBill(id);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load bill');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<BillModel>> createBill(BillCreateRequest request) async {
    try {
      final result = await service.createBill(request);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to create bill');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<BillModel>> updateBill(int id, Map<String, dynamic> data) async {
    try {
      final result = await service.updateBill(id, data);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to update bill');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<PaymentModel>> createPayment(PaymentCreateRequest request) async {
    try {
      final result = await service.createPayment(request);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to create payment');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<List<PaymentModel>>> getPayments({int? page}) async {
    try {
      final result = await service.getPayments(page: page);
      return Success(result.results);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load payments');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<DeliveryModel>> createDelivery(DeliveryCreateRequest request) async {
    try {
      final result = await service.createDelivery(request);
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to create delivery');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<List<ReadyJobModel>>> getReadyDeliveries() async {
    try {
      final result = await service.getReadyDeliveries();
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load ready deliveries');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }

  @override
  Future<Result<List<DeliveryModel>>> getDeliveredItems() async {
    try {
      final result = await service.getDeliveredItems();
      return Success(result);
    } on DioException catch (e) {
      return FailureResult(e.message ?? 'Failed to load delivered items');
    } catch (e) {
      return FailureResult(e.toString());
    }
  }
}
