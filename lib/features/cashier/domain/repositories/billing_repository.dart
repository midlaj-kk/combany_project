import '../../../../core/error/result.dart';
import '../../data/models/bill_model.dart';
import '../../data/models/payment_model.dart';
import '../../data/models/delivery_model.dart';
import '../../data/models/ready_job_model.dart';

abstract class BillingRepository {
  Future<Result<PaginatedBillList>> getBills({String? paymentStatus, int? page});
  Future<Result<BillModel>> getBill(int id);
  Future<Result<BillModel>> createBill(BillCreateRequest request);
  Future<Result<BillModel>> updateBill(int id, Map<String, dynamic> data);
  Future<Result<PaymentModel>> createPayment(PaymentCreateRequest request);
  Future<Result<List<PaymentModel>>> getPayments({int? page});
  Future<Result<DeliveryModel>> createDelivery(DeliveryCreateRequest request);
  Future<Result<List<ReadyJobModel>>> getReadyDeliveries();
  Future<Result<List<DeliveryModel>>> getDeliveredItems();
}
