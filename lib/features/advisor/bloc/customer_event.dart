import '../models/customer_model.dart';

abstract class CustomerEvent {
  const CustomerEvent();
}

class CustomersLoadRequested extends CustomerEvent {
  final String? search;
  final int? page;
  const CustomersLoadRequested({this.search, this.page});
}

class CustomerLoadRequested extends CustomerEvent {
  final int id;
  const CustomerLoadRequested({required this.id});
}

class CustomerCreateRequested extends CustomerEvent {
  final CustomerCreateRequest request;
  const CustomerCreateRequested({required this.request});
}

class CustomerVehiclesLoadRequested extends CustomerEvent {
  final int customerId;
  const CustomerVehiclesLoadRequested({required this.customerId});
}
