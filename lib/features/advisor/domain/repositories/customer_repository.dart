import '../../../../core/error/result.dart';
import '../../data/models/customer_model.dart';
import '../../data/models/vehicle_model.dart';

abstract class CustomerRepository {
  Future<Result<PaginatedCustomerList>> getCustomers({String? search, int? page});
  Future<Result<CustomerModel>> getCustomer(int id);
  Future<Result<CustomerModel>> createCustomer(CustomerCreateRequest request);
  Future<Result<List<VehicleModel>>> getCustomerVehicles(int customerId);
  Future<Result<Map<int, int>>> getVehicleCounts();
}
