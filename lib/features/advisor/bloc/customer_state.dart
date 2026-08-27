import '../models/customer_model.dart';
import '../models/vehicle_model.dart';

abstract class CustomerState {
  const CustomerState();
}

class CustomerInitial extends CustomerState {
  const CustomerInitial();
}

class CustomerLoading extends CustomerState {
  const CustomerLoading();
}

class CustomersLoaded extends CustomerState {
  final PaginatedCustomerList customers;
  final Map<int, int> vehicleCounts;
  const CustomersLoaded({
    required this.customers,
    this.vehicleCounts = const {},
  });
}

class CustomerLoaded extends CustomerState {
  final CustomerModel customer;
  const CustomerLoaded({required this.customer});
}

class CustomerCreated extends CustomerState {
  final CustomerModel customer;
  const CustomerCreated({required this.customer});
}

class CustomerVehiclesLoaded extends CustomerState {
  final List<VehicleModel> vehicles;
  const CustomerVehiclesLoaded({required this.vehicles});
}

class CustomerError extends CustomerState {
  final String message;
  const CustomerError({required this.message});
}
