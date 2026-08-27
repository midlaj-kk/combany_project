import '../models/bill_model.dart';
import '../models/payment_model.dart';
import '../models/delivery_model.dart';
import '../models/ready_job_model.dart';

abstract class BillingState {
  const BillingState();
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
}

class BillingBillLoaded extends BillingState {
  final BillModel bill;
  const BillingBillLoaded({required this.bill});
}

class BillingBillCreated extends BillingState {
  final BillModel bill;
  const BillingBillCreated({required this.bill});
}

class BillingBillUpdated extends BillingState {
  final BillModel bill;
  const BillingBillUpdated({required this.bill});
}

class BillingPaymentCreated extends BillingState {
  final PaymentModel payment;
  const BillingPaymentCreated({required this.payment});
}

class BillingPaymentsLoaded extends BillingState {
  final List<PaymentModel> payments;
  const BillingPaymentsLoaded({required this.payments});
}

class BillingDeliveryCreated extends BillingState {
  final DeliveryModel delivery;
  const BillingDeliveryCreated({required this.delivery});
}

class BillingReadyDeliveriesLoaded extends BillingState {
  final List<ReadyJobModel> deliveries;
  const BillingReadyDeliveriesLoaded({required this.deliveries});
}

class BillingCashierHomeLoaded extends BillingState {
  final PaginatedBillList bills;
  final List<ReadyJobModel> readyDeliveries;
  const BillingCashierHomeLoaded({required this.bills, required this.readyDeliveries});
}

class BillingDeliveredItemsLoaded extends BillingState {
  final List<DeliveryModel> deliveries;
  const BillingDeliveredItemsLoaded({required this.deliveries});
}

class BillingError extends BillingState {
  final String message;
  const BillingError({required this.message});
}
