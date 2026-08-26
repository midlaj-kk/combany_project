import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../data/models/customer_model.dart';
import '../../data/models/vehicle_model.dart';

// ── Events ─────────────────────────────────────────────────────────────────

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();
  @override
  List<Object?> get props => [];
}

class CustomersLoadRequested extends CustomerEvent {
  final String? search;
  final int? page;
  const CustomersLoadRequested({this.search, this.page});
  @override
  List<Object?> get props => [search, page];
}

class CustomerLoadRequested extends CustomerEvent {
  final int id;
  const CustomerLoadRequested({required this.id});
  @override
  List<Object?> get props => [id];
}

class CustomerCreateRequested extends CustomerEvent {
  final CustomerCreateRequest request;
  const CustomerCreateRequested({required this.request});
  @override
  List<Object?> get props => [request];
}

class CustomerVehiclesLoadRequested extends CustomerEvent {
  final int customerId;
  const CustomerVehiclesLoadRequested({required this.customerId});
  @override
  List<Object?> get props => [customerId];
}

// ── States ─────────────────────────────────────────────────────────────────

abstract class CustomerState extends Equatable {
  const CustomerState();
  @override
  List<Object?> get props => [];
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
  @override
  List<Object?> get props => [customers, vehicleCounts];
}

class CustomerLoaded extends CustomerState {
  final CustomerModel customer;
  const CustomerLoaded({required this.customer});
  @override
  List<Object?> get props => [customer];
}

class CustomerCreated extends CustomerState {
  final CustomerModel customer;
  const CustomerCreated({required this.customer});
  @override
  List<Object?> get props => [customer];
}

class CustomerVehiclesLoaded extends CustomerState {
  final List<VehicleModel> vehicles;
  const CustomerVehiclesLoaded({required this.vehicles});
  @override
  List<Object?> get props => [vehicles];
}

class CustomerError extends CustomerState {
  final String message;
  const CustomerError({required this.message});
  @override
  List<Object?> get props => [message];
}

// ── Bloc ───────────────────────────────────────────────────────────────────

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository repository;

  CustomerBloc({required this.repository}) : super(const CustomerInitial()) {
    on<CustomersLoadRequested>(_onLoadCustomers);
    on<CustomerLoadRequested>(_onLoadCustomer);
    on<CustomerCreateRequested>(_onCreateCustomer);
    on<CustomerVehiclesLoadRequested>(_onLoadCustomerVehicles);
  }

  Future<void> _onLoadCustomers(
    CustomersLoadRequested event,
    Emitter<CustomerState> emit,
  ) async {
    emit(const CustomerLoading());
    final results = await Future.wait([
      repository.getCustomers(search: event.search, page: event.page),
      repository.getVehicleCounts(),
    ]);
    final customersResult = results[0] as Result<PaginatedCustomerList>;
    final countsResult = results[1] as Result<Map<int, int>>;
    switch (customersResult) {
      case Success<PaginatedCustomerList>():
        emit(CustomersLoaded(
          customers: customersResult.data,
          vehicleCounts:
              countsResult is Success<Map<int, int>> ? countsResult.data : {},
        ));
      case FailureResult<PaginatedCustomerList>():
        emit(CustomerError(message: customersResult.message));
    }
  }

  Future<void> _onLoadCustomer(
    CustomerLoadRequested event,
    Emitter<CustomerState> emit,
  ) async {
    emit(const CustomerLoading());
    final result = await repository.getCustomer(event.id);
    switch (result) {
      case Success<CustomerModel>():
        emit(CustomerLoaded(customer: result.data));
      case FailureResult<CustomerModel>():
        emit(CustomerError(message: result.message));
    }
  }

  Future<void> _onCreateCustomer(
    CustomerCreateRequested event,
    Emitter<CustomerState> emit,
  ) async {
    emit(const CustomerLoading());
    final result = await repository.createCustomer(event.request);
    switch (result) {
      case Success<CustomerModel>():
        emit(CustomerCreated(customer: result.data));
      case FailureResult<CustomerModel>():
        emit(CustomerError(message: result.message));
    }
  }

  Future<void> _onLoadCustomerVehicles(
    CustomerVehiclesLoadRequested event,
    Emitter<CustomerState> emit,
  ) async {
    // Intentionally no CustomerLoading emission: wiping the visible
    // customer list for a background vehicles lookup made the list vanish.
    final result = await repository.getCustomerVehicles(event.customerId);
    switch (result) {
      case Success<List<VehicleModel>>():
        emit(CustomerVehiclesLoaded(vehicles: result.data));
      case FailureResult<List<VehicleModel>>():
        emit(CustomerError(message: result.message));
    }
  }
}
