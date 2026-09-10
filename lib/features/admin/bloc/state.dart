import '../models/user_model.dart';
import '../models/spare_part_model.dart';

abstract class AdminState {
  const AdminState();
}

class AdminInitial extends AdminState {
  const AdminInitial();
}

class AdminLoading extends AdminState {
  const AdminLoading();
}

class AdminUsersLoaded extends AdminState {
  final PaginatedUserList users;
  const AdminUsersLoaded({required this.users});
}

class AdminUserCreated extends AdminState {
  final UserModel user;
  const AdminUserCreated({required this.user});
}

class AdminUserActionSuccess extends AdminState {
  final String message;
  const AdminUserActionSuccess({required this.message});
}

class AdminSparePartsLoaded extends AdminState {
  final PaginatedSparePartList spareParts;
  const AdminSparePartsLoaded({required this.spareParts});
}

class AdminSparePartLoaded extends AdminState {
  final SparePartModel sparePart;
  const AdminSparePartLoaded({required this.sparePart});
}

class AdminStockActionSuccess extends AdminState {
  final String message;
  const AdminStockActionSuccess({required this.message});
}

class AdminStockHistoryLoaded extends AdminState {
  final List<dynamic> history;
  const AdminStockHistoryLoaded({required this.history});
}

class AdminDashboardLoaded extends AdminState {
  final Map<String, dynamic> summary;
  const AdminDashboardLoaded({required this.summary});
}

class AdminMonthlyRevenueLoaded extends AdminState {
  final dynamic data;
  const AdminMonthlyRevenueLoaded({required this.data});
}

class AdminCompletedServicesLoaded extends AdminState {
  final dynamic data;
  const AdminCompletedServicesLoaded({required this.data});
}

class AdminMechanicProductivityLoaded extends AdminState {
  final dynamic data;
  const AdminMechanicProductivityLoaded({required this.data});
}

class AdminSparePartsUsageLoaded extends AdminState {
  final dynamic data;
  const AdminSparePartsUsageLoaded({required this.data});
}

class AdminDailyRevenueLoaded extends AdminState {
  final dynamic data;
  const AdminDailyRevenueLoaded({required this.data});
}

class AdminPendingPaymentsLoaded extends AdminState {
  final int count;
  final double total;
  const AdminPendingPaymentsLoaded({required this.count, required this.total});
}

class AdminLowStockLoaded extends AdminState {
  final int count;
  const AdminLowStockLoaded({required this.count});
}

class AdminError extends AdminState {
  final String message;
  const AdminError({required this.message});
}
