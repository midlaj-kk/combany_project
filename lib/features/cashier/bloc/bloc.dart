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
    on<BillingPaymentCreateRequested>(_onCreatePayment);
    on<BillingPaymentsLoadRequested>(_onLoadPayments);
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

  Future<void> _onCreatePayment(BillingPaymentCreateRequested event, Emitter<BillingState> emit) async {
    emit(const BillingLoading());
    try {
      final payment = await service.createPayment(event.request);
      emit(BillingPaymentCreated(payment: payment));
    } catch (e) {
      emit(BillingError(message: e.toString()));
    }
  }

  Future<void> _onLoadPayments(BillingPaymentsLoadRequested event, Emitter<BillingState> emit) async {
    emit(const BillingLoading());
    try {
      final result = await service.getPayments(page: event.page);
      emit(BillingPaymentsLoaded(payments: result.results));
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
      PaginatedBillList? bills;
      List<ReadyJobModel>? readyForBilling;

      final results = await Future.wait([
        service.getBills(),
        service.getReadyForBillingJobs(),
      ]);

      bills = results[0] as PaginatedBillList;
      readyForBilling = results[1] as List<ReadyJobModel>;

      emit(BillingCashierHomeLoaded(
        bills: bills,
        readyForBilling: readyForBilling,
      ));
    } catch (e) {
      emit(BillingError(message: e.toString()));
    }
  }
}
