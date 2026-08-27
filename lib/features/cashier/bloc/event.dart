import '../models/bill_model.dart';
import '../models/payment_model.dart';
import '../models/delivery_model.dart';

abstract class BillingEvent {
  const BillingEvent();
}

class BillingBillsLoadRequested extends BillingEvent {
  final String? paymentStatus;
  final int? page;
  const BillingBillsLoadRequested({this.paymentStatus, this.page});
}

class BillingBillLoadRequested extends BillingEvent {
  final int id;
  const BillingBillLoadRequested({required this.id});
}

class BillingBillCreateRequested extends BillingEvent {
  final BillCreateRequest request;
  const BillingBillCreateRequested({required this.request});
}

class BillingBillUpdateRequested extends BillingEvent {
  final int id;
  final Map<String, dynamic> data;
  const BillingBillUpdateRequested({required this.id, required this.data});
}

class BillingPaymentCreateRequested extends BillingEvent {
  final PaymentCreateRequest request;
  const BillingPaymentCreateRequested({required this.request});
}

class BillingPaymentsLoadRequested extends BillingEvent {
  final int? page;
  const BillingPaymentsLoadRequested({this.page});
}

class BillingDeliveryCreateRequested extends BillingEvent {
  final DeliveryCreateRequest request;
  const BillingDeliveryCreateRequested({required this.request});
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
