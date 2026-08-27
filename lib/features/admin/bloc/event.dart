import '../models/user_model.dart';

abstract class AdminEvent {
  const AdminEvent();
}

class AdminUsersLoadRequested extends AdminEvent {
  final String? search;
  final int? page;
  const AdminUsersLoadRequested({this.search, this.page});
}

class AdminUserCreateRequested extends AdminEvent {
  final UserCreateRequest request;
  const AdminUserCreateRequested({required this.request});
}

class AdminUserDeleteRequested extends AdminEvent {
  final int id;
  const AdminUserDeleteRequested({required this.id});
}

class AdminUserActivateRequested extends AdminEvent {
  final int id;
  const AdminUserActivateRequested({required this.id});
}

class AdminUserDeactivateRequested extends AdminEvent {
  final int id;
  const AdminUserDeactivateRequested({required this.id});
}

class AdminSparePartsLoadRequested extends AdminEvent {
  final String? search;
  final int? page;
  const AdminSparePartsLoadRequested({this.search, this.page});
}

class AdminSparePartLoadRequested extends AdminEvent {
  final int id;
  const AdminSparePartLoadRequested({required this.id});
}

class AdminAddStockRequested extends AdminEvent {
  final int partId;
  final String quantity;
  const AdminAddStockRequested({required this.partId, required this.quantity});
}

class AdminReduceStockRequested extends AdminEvent {
  final int partId;
  final String quantity;
  const AdminReduceStockRequested({required this.partId, required this.quantity});
}

class AdminStockHistoryRequested extends AdminEvent {
  final int partId;
  const AdminStockHistoryRequested({required this.partId});
}

class AdminDashboardSummaryRequested extends AdminEvent {
  const AdminDashboardSummaryRequested();
}

class AdminMonthlyRevenueRequested extends AdminEvent {
  const AdminMonthlyRevenueRequested();
}

class AdminCompletedServicesRequested extends AdminEvent {
  const AdminCompletedServicesRequested();
}

class AdminMechanicProductivityRequested extends AdminEvent {
  const AdminMechanicProductivityRequested();
}

class AdminSparePartsUsageRequested extends AdminEvent {
  const AdminSparePartsUsageRequested();
}

class AdminDailyRevenueRequested extends AdminEvent {
  const AdminDailyRevenueRequested();
}
