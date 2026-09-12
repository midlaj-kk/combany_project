import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/cashier_service.dart';
import '../models/bill_model.dart';
import '../models/ready_job_model.dart';
import 'event.dart';
import 'state.dart';

class BillingBloc extends Bloc<BillingEvent, BillingState> {
  final CashierService service;

  BillingBloc({required this.service}) : super(const BillingInitial()) {
    on<BillingBillsLoadRequested>(_onLoadBills);
    on<BillingBillLoadRequested>(_onLoadBill);
    on<BillingBillCreateRequested>(_onCreateBill);
    on<BillingBillUpdateRequested>(_onUpdateBill);
    on<BillingDeliveryCreateRequested>(_onCreateDelivery);
    on<BillingReadyDeliveriesLoadRequested>(_onLoadReadyDeliveries);
    on<BillingDeliveredItemsLoadRequested>(_onLoadDeliveredItems);
    on<BillingCashierHomeLoadRequested>(_onLoadCashierHome);
  }

  Future<void> _onLoadBills(BillingBillsLoadRequested event, Emitter<BillingState> emit) async {
    emit(const BillingLoading());
    try {
      final bills = await service.getBills(paymentStatus: event.paymentStatus, page: event.page);
      emit(BillingBillsLoaded(bills: bills));
    } catch (e) {
      emit(BillingError(message: e.toString()));
    }
  }

  Future<void> _onLoadBill(BillingBillLoadRequested event, Emitter<BillingState> emit) async {
    emit(const BillingLoading());
    try {
      final bill = await service.getBill(event.id);
      emit(BillingBillLoaded(bill: bill));
    } catch (e) {
      emit(BillingError(message: e.toString()));
    }
  }

  Future<void> _onCreateBill(BillingBillCreateRequested event, Emitter<BillingState> emit) async {
    emit(const BillingLoading());
    try {
      final bill = await service.createBill(event.request);
      emit(BillingBillCreated(bill: bill));
    } catch (e) {
      emit(BillingError(message: e.toString()));
    }
  }

  Future<void> _onUpdateBill(BillingBillUpdateRequested event, Emitter<BillingState> emit) async {
    emit(const BillingLoading());
    try {
      final bill = await service.updateBill(event.id, event.data);
      emit(BillingBillUpdated(bill: bill));
    } catch (e) {
      emit(BillingError(message: e.toString()));
    }
  }

  Future<void> _onCreateDelivery(BillingDeliveryCreateRequested event, Emitter<BillingState> emit) async {
    emit(const BillingLoading());
    try {
      final delivery = await service.createDelivery(event.request);
      emit(BillingDeliveryCreated(delivery: delivery));
    } catch (e) {
      emit(BillingError(message: e.toString()));
    }
  }

  Future<void> _onLoadReadyDeliveries(BillingReadyDeliveriesLoadRequested event, Emitter<BillingState> emit) async {
    emit(const BillingLoading());
    try {
      final deliveries = await service.getReadyDeliveries();
      emit(BillingReadyDeliveriesLoaded(deliveries: deliveries));
    } catch (e) {
      emit(BillingError(message: e.toString()));
    }
  }

  Future<void> _onLoadDeliveredItems(BillingDeliveredItemsLoadRequested event, Emitter<BillingState> emit) async {
    emit(const BillingLoading());
    try {
      final deliveries = await service.getDeliveredItems();
      emit(BillingDeliveredItemsLoaded(deliveries: deliveries));
    } catch (e) {
      emit(BillingError(message: e.toString()));
    }
  }

  Future<void> _onLoadCashierHome(BillingCashierHomeLoadRequested event, Emitter<BillingState> emit) async {
    emit(const BillingLoading());
    try {
      final results = await Future.wait([
        service.getBills(),
        service.getReadyForBillingJobs(),
        service.getReadyDeliveries(),
      ]);

      final bills = results[0] as PaginatedBillList;
      final readyForBilling = (results[1] as List<ReadyJobModel>)
          .where((job) => !job.hasBill)
          .toList();
      final readyForDelivery = results[2] as List<ReadyJobModel>;

      emit(BillingCashierHomeLoaded(
        bills: bills,
        readyForBilling: readyForBilling,
        readyForDelivery: readyForDelivery,
      ));
    } catch (e) {
      emit(BillingError(message: e.toString()));
    }
  }
}
