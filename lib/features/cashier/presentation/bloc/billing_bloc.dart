import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/billing_repository.dart';
import '../../data/models/bill_model.dart';
import '../../data/models/payment_model.dart';
import '../../data/models/delivery_model.dart';
import '../../data/models/ready_job_model.dart';

// ── Events ─────────────────────────────────────────────────────────────────

abstract class BillingEvent extends Equatable {
  const BillingEvent();
  @override
  List<Object?> get props => [];
}

class BillingBillsLoadRequested extends BillingEvent {
  final String? paymentStatus;
  final int? page;
  const BillingBillsLoadRequested({this.paymentStatus, this.page});
  @override
  List<Object?> get props => [paymentStatus, page];
}

class BillingBillLoadRequested extends BillingEvent {
  final int id;
  const BillingBillLoadRequested({required this.id});
  @override
  List<Object?> get props => [id];
}

class BillingBillCreateRequested extends BillingEvent {
  final BillCreateRequest request;
  const BillingBillCreateRequested({required this.request});
  @override
  List<Object?> get props => [request];
}

class BillingBillUpdateRequested extends BillingEvent {
  final int id;
  final Map<String, dynamic> data;
  const BillingBillUpdateRequested({required this.id, required this.data});
  @override
  List<Object?> get props => [id, data];
}

class BillingPaymentCreateRequested extends BillingEvent {
  final PaymentCreateRequest request;
  const BillingPaymentCreateRequested({required this.request});
  @override
  List<Object?> get props => [request];
}

class BillingPaymentsLoadRequested extends BillingEvent {
  final int? page;
  const BillingPaymentsLoadRequested({this.page});
  @override
  List<Object?> get props => [page];
}

class BillingDeliveryCreateRequested extends BillingEvent {
  final DeliveryCreateRequest request;
  const BillingDeliveryCreateRequested({required this.request});
  @override
  List<Object?> get props => [request];
}

class BillingReadyDeliveriesLoadRequested extends BillingEvent {
  const BillingReadyDeliveriesLoadRequested();
}

class BillingDeliveredItemsLoadRequested extends BillingEvent {
  const BillingDeliveredItemsLoadRequested();
}

class BillingCashierHomeLoadRequested extends BillingEvent {
  const BillingCashierHomeLoadRequested();
}

// ── States ─────────────────────────────────────────────────────────────────

abstract class BillingState extends Equatable {
  const BillingState();
  @override
  List<Object?> get props => [];
}

class BillingInitial extends BillingState {
  const BillingInitial();
}

class BillingLoading extends BillingState {
  const BillingLoading();
}

class BillingBillsLoaded extends BillingState {
  final PaginatedBillList bills;
  const BillingBillsLoaded({required this.bills});
  @override
  List<Object?> get props => [bills];
}

class BillingBillLoaded extends BillingState {
  final BillModel bill;
  const BillingBillLoaded({required this.bill});
  @override
  List<Object?> get props => [bill];
}

class BillingBillCreated extends BillingState {
  final BillModel bill;
  const BillingBillCreated({required this.bill});
  @override
  List<Object?> get props => [bill];
}

class BillingBillUpdated extends BillingState {
  final BillModel bill;
  const BillingBillUpdated({required this.bill});
  @override
  List<Object?> get props => [bill];
}

class BillingPaymentCreated extends BillingState {
  final PaymentModel payment;
  const BillingPaymentCreated({required this.payment});
  @override
  List<Object?> get props => [payment];
}

class BillingPaymentsLoaded extends BillingState {
  final List<PaymentModel> payments;
  const BillingPaymentsLoaded({required this.payments});
  @override
  List<Object?> get props => [payments];
}

class BillingDeliveryCreated extends BillingState {
  final DeliveryModel delivery;
  const BillingDeliveryCreated({required this.delivery});
  @override
  List<Object?> get props => [delivery];
}

class BillingReadyDeliveriesLoaded extends BillingState {
  final List<ReadyJobModel> deliveries;
  const BillingReadyDeliveriesLoaded({required this.deliveries});
  @override
  List<Object?> get props => [deliveries];
}

class BillingCashierHomeLoaded extends BillingState {
  final PaginatedBillList bills;
  final List<ReadyJobModel> readyDeliveries;
  const BillingCashierHomeLoaded({
    required this.bills,
    required this.readyDeliveries,
  });
  @override
  List<Object?> get props => [bills, readyDeliveries];
}

class BillingDeliveredItemsLoaded extends BillingState {
  final List<DeliveryModel> deliveries;
  const BillingDeliveredItemsLoaded({required this.deliveries});
  @override
  List<Object?> get props => [deliveries];
}

class BillingError extends BillingState {
  final String message;
  const BillingError({required this.message});
  @override
  List<Object?> get props => [message];
}

// ── Bloc ───────────────────────────────────────────────────────────────────

class BillingBloc extends Bloc<BillingEvent, BillingState> {
  final BillingRepository repository;

  BillingBloc({required this.repository}) : super(const BillingInitial()) {
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

  Future<void> _onLoadBills(
    BillingBillsLoadRequested event,
    Emitter<BillingState> emit,
  ) async {
    emit(const BillingLoading());
    final result = await repository.getBills(
      paymentStatus: event.paymentStatus,
      page: event.page,
    );
    switch (result) {
      case Success<PaginatedBillList>():
        emit(BillingBillsLoaded(bills: result.data));
      case FailureResult<PaginatedBillList>():
        emit(BillingError(message: result.message));
    }
  }

  Future<void> _onLoadBill(
    BillingBillLoadRequested event,
    Emitter<BillingState> emit,
  ) async {
    emit(const BillingLoading());
    final result = await repository.getBill(event.id);
    switch (result) {
      case Success<BillModel>():
        emit(BillingBillLoaded(bill: result.data));
      case FailureResult<BillModel>():
        emit(BillingError(message: result.message));
    }
  }

  Future<void> _onCreateBill(
    BillingBillCreateRequested event,
    Emitter<BillingState> emit,
  ) async {
    emit(const BillingLoading());
    final result = await repository.createBill(event.request);
    switch (result) {
      case Success<BillModel>():
        emit(BillingBillCreated(bill: result.data));
      case FailureResult<BillModel>():
        emit(BillingError(message: result.message));
    }
  }

  Future<void> _onUpdateBill(
    BillingBillUpdateRequested event,
    Emitter<BillingState> emit,
  ) async {
    emit(const BillingLoading());
    final result = await repository.updateBill(event.id, event.data);
    switch (result) {
      case Success<BillModel>():
        emit(BillingBillUpdated(bill: result.data));
      case FailureResult<BillModel>():
        emit(BillingError(message: result.message));
    }
  }

  Future<void> _onCreatePayment(
    BillingPaymentCreateRequested event,
    Emitter<BillingState> emit,
  ) async {
    emit(const BillingLoading());
    final result = await repository.createPayment(event.request);
    switch (result) {
      case Success<PaymentModel>():
        emit(BillingPaymentCreated(payment: result.data));
      case FailureResult<PaymentModel>():
        emit(BillingError(message: result.message));
    }
  }

  Future<void> _onLoadPayments(
    BillingPaymentsLoadRequested event,
    Emitter<BillingState> emit,
  ) async {
    emit(const BillingLoading());
    final result = await repository.getPayments(page: event.page);
    switch (result) {
      case Success<List<PaymentModel>>():
        emit(BillingPaymentsLoaded(payments: result.data));
      case FailureResult<List<PaymentModel>>():
        emit(BillingError(message: result.message));
    }
  }

  Future<void> _onCreateDelivery(
    BillingDeliveryCreateRequested event,
    Emitter<BillingState> emit,
  ) async {
    emit(const BillingLoading());
    final result = await repository.createDelivery(event.request);
    switch (result) {
      case Success<DeliveryModel>():
        emit(BillingDeliveryCreated(delivery: result.data));
      case FailureResult<DeliveryModel>():
        emit(BillingError(message: result.message));
    }
  }

  Future<void> _onLoadReadyDeliveries(
    BillingReadyDeliveriesLoadRequested event,
    Emitter<BillingState> emit,
  ) async {
    emit(const BillingLoading());
    final result = await repository.getReadyDeliveries();
    switch (result) {
      case Success<List<ReadyJobModel>>():
        emit(BillingReadyDeliveriesLoaded(deliveries: result.data));
      case FailureResult<List<ReadyJobModel>>():
        emit(BillingError(message: result.message));
    }
  }

  Future<void> _onLoadDeliveredItems(
    BillingDeliveredItemsLoadRequested event,
    Emitter<BillingState> emit,
  ) async {
    emit(const BillingLoading());
    final result = await repository.getDeliveredItems();
    switch (result) {
      case Success<List<DeliveryModel>>():
        emit(BillingDeliveredItemsLoaded(deliveries: result.data));
      case FailureResult<List<DeliveryModel>>():
        emit(BillingError(message: result.message));
    }
  }

  Future<void> _onLoadCashierHome(
    BillingCashierHomeLoadRequested event,
    Emitter<BillingState> emit,
  ) async {
    emit(const BillingLoading());
    final results = await Future.wait([
      repository.getBills(),
      repository.getReadyDeliveries(),
    ]);
    final billsResult = results[0] as Result<PaginatedBillList>;
    final deliveriesResult = results[1] as Result<List<ReadyJobModel>>;

    final bills = billsResult is Success<PaginatedBillList> ? billsResult.data : null;
    final deliveries = deliveriesResult is Success<List<ReadyJobModel>> ? deliveriesResult.data : null;

    if (bills == null && deliveries == null) {
      final msg = billsResult is FailureResult<PaginatedBillList>
          ? billsResult.message
          : deliveriesResult is FailureResult<List<ReadyJobModel>>
              ? deliveriesResult.message
              : 'Failed to load data';
      emit(BillingError(message: msg));
      return;
    }

    emit(BillingCashierHomeLoaded(
      bills: bills ?? const PaginatedBillList(count: 0, results: []),
      readyDeliveries: deliveries ?? [],
    ));
  }
}
