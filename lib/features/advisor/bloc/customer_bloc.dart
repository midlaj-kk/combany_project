import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/advisor_service.dart';
import '../models/vehicle_model.dart';
import 'customer_event.dart';
import 'customer_state.dart';

export 'customer_event.dart';
export 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final AdvisorService service;

  CustomerBloc({required this.service}) : super(const CustomerInitial()) {
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
    try {
      final customers = await service.getCustomers(
        search: event.search,
        page: event.page,
      );

      Map<int, int> vehicleCounts = {};
      try {
        final vehicles = await service.getAllVehicles();
        for (final vehicle in vehicles) {
          final customerId = vehicle.customer;
          if (customerId != null) {
            vehicleCounts[customerId] = (vehicleCounts[customerId] ?? 0) + 1;
          }
        }
      } catch (_) {}

      emit(CustomersLoaded(
        customers: customers,
        vehicleCounts: vehicleCounts,
      ));
    } catch (e) {
      emit(CustomerError(message: e.toString()));
    }
  }

  Future<void> _onLoadCustomer(
    CustomerLoadRequested event,
    Emitter<CustomerState> emit,
  ) async {
    emit(const CustomerLoading());
    try {
      final customer = await service.getCustomer(event.id);
      emit(CustomerLoaded(customer: customer));
    } catch (e) {
      emit(CustomerError(message: e.toString()));
    }
  }

  Future<void> _onCreateCustomer(
    CustomerCreateRequested event,
    Emitter<CustomerState> emit,
  ) async {
    emit(const CustomerLoading());
    try {
      final customer = await service.createCustomer(event.request);
      emit(CustomerCreated(customer: customer));
    } catch (e) {
      emit(CustomerError(message: e.toString()));
    }
  }

  Future<void> _onLoadCustomerVehicles(
    CustomerVehiclesLoadRequested event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      final rawVehicles = await service.getCustomerVehicles(event.customerId);
      final vehicles = rawVehicles
          .map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
          .toList();
      emit(CustomerVehiclesLoaded(vehicles: vehicles));
    } catch (e) {
      emit(CustomerError(message: e.toString()));
    }
  }
}
