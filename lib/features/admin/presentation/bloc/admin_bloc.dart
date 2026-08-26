import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/result.dart';
import '../../domain/repositories/admin_repository.dart';
import '../../data/models/user_model.dart';
import '../../data/models/spare_part_model.dart';

// ── Events ─────────────────────────────────────────────────────────────────

abstract class AdminEvent extends Equatable {
  const AdminEvent();
  @override
  List<Object?> get props => [];
}

class AdminUsersLoadRequested extends AdminEvent {
  final String? search;
  final int? page;
  const AdminUsersLoadRequested({this.search, this.page});
  @override
  List<Object?> get props => [search, page];
}

class AdminUserCreateRequested extends AdminEvent {
  final UserCreateRequest request;
  const AdminUserCreateRequested({required this.request});
  @override
  List<Object?> get props => [request];
}

class AdminUserDeleteRequested extends AdminEvent {
  final int id;
  const AdminUserDeleteRequested({required this.id});
  @override
  List<Object?> get props => [id];
}

class AdminUserActivateRequested extends AdminEvent {
  final int id;
  const AdminUserActivateRequested({required this.id});
  @override
  List<Object?> get props => [id];
}

class AdminUserDeactivateRequested extends AdminEvent {
  final int id;
  const AdminUserDeactivateRequested({required this.id});
  @override
  List<Object?> get props => [id];
}

class AdminSparePartsLoadRequested extends AdminEvent {
  final String? search;
  final int? page;
  const AdminSparePartsLoadRequested({this.search, this.page});
  @override
  List<Object?> get props => [search, page];
}

class AdminSparePartLoadRequested extends AdminEvent {
  final int id;
  const AdminSparePartLoadRequested({required this.id});
  @override
  List<Object?> get props => [id];
}

class AdminAddStockRequested extends AdminEvent {
  final int partId;
  final String quantity;
  const AdminAddStockRequested({required this.partId, required this.quantity});
  @override
  List<Object?> get props => [partId, quantity];
}

class AdminReduceStockRequested extends AdminEvent {
  final int partId;
  final String quantity;
  const AdminReduceStockRequested({required this.partId, required this.quantity});
  @override
  List<Object?> get props => [partId, quantity];
}

class AdminStockHistoryRequested extends AdminEvent {
  final int partId;
  const AdminStockHistoryRequested({required this.partId});
  @override
  List<Object?> get props => [partId];
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

// ── States ─────────────────────────────────────────────────────────────────

abstract class AdminState extends Equatable {
  const AdminState();
  @override
  List<Object?> get props => [];
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
  @override
  List<Object?> get props => [users];
}

class AdminUserCreated extends AdminState {
  final UserModel user;
  const AdminUserCreated({required this.user});
  @override
  List<Object?> get props => [user];
}

class AdminUserActionSuccess extends AdminState {
  final String message;
  const AdminUserActionSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}

class AdminSparePartsLoaded extends AdminState {
  final PaginatedSparePartList spareParts;
  const AdminSparePartsLoaded({required this.spareParts});
  @override
  List<Object?> get props => [spareParts];
}

class AdminSparePartLoaded extends AdminState {
  final SparePartModel sparePart;
  const AdminSparePartLoaded({required this.sparePart});
  @override
  List<Object?> get props => [sparePart];
}

class AdminStockActionSuccess extends AdminState {
  final String message;
  const AdminStockActionSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}

class AdminStockHistoryLoaded extends AdminState {
  final List<dynamic> history;
  const AdminStockHistoryLoaded({required this.history});
  @override
  List<Object?> get props => [history];
}

class AdminDashboardLoaded extends AdminState {
  final Map<String, dynamic> summary;
  const AdminDashboardLoaded({required this.summary});
  @override
  List<Object?> get props => [summary];
}

class AdminMonthlyRevenueLoaded extends AdminState {
  final dynamic data;
  const AdminMonthlyRevenueLoaded({required this.data});
  @override
  List<Object?> get props => [data];
}

class AdminCompletedServicesLoaded extends AdminState {
  final dynamic data;
  const AdminCompletedServicesLoaded({required this.data});
  @override
  List<Object?> get props => [data];
}

class AdminMechanicProductivityLoaded extends AdminState {
  final dynamic data;
  const AdminMechanicProductivityLoaded({required this.data});
  @override
  List<Object?> get props => [data];
}

class AdminSparePartsUsageLoaded extends AdminState {
  final dynamic data;
  const AdminSparePartsUsageLoaded({required this.data});
  @override
  List<Object?> get props => [data];
}

class AdminDailyRevenueLoaded extends AdminState {
  final dynamic data;
  const AdminDailyRevenueLoaded({required this.data});
  @override
  List<Object?> get props => [data];
}

class AdminError extends AdminState {
  final String message;
  const AdminError({required this.message});
  @override
  List<Object?> get props => [message];
}

// ── Bloc ───────────────────────────────────────────────────────────────────

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminRepository repository;

  AdminBloc({required this.repository}) : super(const AdminInitial()) {
    on<AdminUsersLoadRequested>(_onLoadUsers);
    on<AdminUserCreateRequested>(_onCreateUser);
    on<AdminUserDeleteRequested>(_onDeleteUser);
    on<AdminUserActivateRequested>(_onActivateUser);
    on<AdminUserDeactivateRequested>(_onDeactivateUser);
    on<AdminSparePartsLoadRequested>(_onLoadSpareParts);
    on<AdminSparePartLoadRequested>(_onLoadSparePart);
    on<AdminAddStockRequested>(_onAddStock);
    on<AdminReduceStockRequested>(_onReduceStock);
    on<AdminStockHistoryRequested>(_onStockHistory);
    on<AdminDashboardSummaryRequested>(_onDashboardSummary);
    on<AdminMonthlyRevenueRequested>(_onMonthlyRevenue);
    on<AdminCompletedServicesRequested>(_onCompletedServices);
    on<AdminMechanicProductivityRequested>(_onMechanicProductivity);
    on<AdminSparePartsUsageRequested>(_onSparePartsUsage);
    on<AdminDailyRevenueRequested>(_onDailyRevenue);
  }

  Future<void> _onLoadUsers(
    AdminUsersLoadRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.getUsers(search: event.search, page: event.page);
    switch (result) {
      case Success<PaginatedUserList>():
        emit(AdminUsersLoaded(users: result.data));
      case FailureResult<PaginatedUserList>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onCreateUser(
    AdminUserCreateRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.createUser(event.request);
    switch (result) {
      case Success<UserModel>():
        emit(AdminUserCreated(user: result.data));
      case FailureResult<UserModel>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onDeleteUser(
    AdminUserDeleteRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.deleteUser(event.id);
    switch (result) {
      case Success<void>():
        emit(const AdminUserActionSuccess(message: 'User deleted successfully'));
      case FailureResult<void>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onActivateUser(
    AdminUserActivateRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.activateUser(event.id);
    switch (result) {
      case Success<void>():
        emit(const AdminUserActionSuccess(message: 'User activated successfully'));
      case FailureResult<void>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onDeactivateUser(
    AdminUserDeactivateRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.deactivateUser(event.id);
    switch (result) {
      case Success<void>():
        emit(const AdminUserActionSuccess(message: 'User deactivated successfully'));
      case FailureResult<void>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onLoadSpareParts(
    AdminSparePartsLoadRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.getSpareParts(search: event.search, page: event.page);
    switch (result) {
      case Success<PaginatedSparePartList>():
        emit(AdminSparePartsLoaded(spareParts: result.data));
      case FailureResult<PaginatedSparePartList>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onLoadSparePart(
    AdminSparePartLoadRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.getSparePart(event.id);
    switch (result) {
      case Success<SparePartModel>():
        emit(AdminSparePartLoaded(sparePart: result.data));
      case FailureResult<SparePartModel>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onAddStock(
    AdminAddStockRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.addStock(event.partId, event.quantity);
    switch (result) {
      case Success<void>():
        emit(const AdminStockActionSuccess(message: 'Stock added successfully'));
      case FailureResult<void>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onReduceStock(
    AdminReduceStockRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.reduceStock(event.partId, event.quantity);
    switch (result) {
      case Success<void>():
        emit(const AdminStockActionSuccess(message: 'Stock reduced successfully'));
      case FailureResult<void>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onStockHistory(
    AdminStockHistoryRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.getStockHistory(event.partId);
    switch (result) {
      case Success<List<dynamic>>():
        emit(AdminStockHistoryLoaded(history: result.data));
      case FailureResult<List<dynamic>>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onDashboardSummary(
    AdminDashboardSummaryRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.getDashboardSummary();
    switch (result) {
      case Success<Map<String, dynamic>>():
        emit(AdminDashboardLoaded(summary: result.data));
      case FailureResult<Map<String, dynamic>>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onMonthlyRevenue(
    AdminMonthlyRevenueRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.getMonthlyRevenue();
    switch (result) {
      case Success<dynamic>():
        emit(AdminMonthlyRevenueLoaded(data: result.data));
      case FailureResult<dynamic>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onCompletedServices(
    AdminCompletedServicesRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.getCompletedServices();
    switch (result) {
      case Success<dynamic>():
        emit(AdminCompletedServicesLoaded(data: result.data));
      case FailureResult<dynamic>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onMechanicProductivity(
    AdminMechanicProductivityRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.getMechanicProductivity();
    switch (result) {
      case Success<dynamic>():
        emit(AdminMechanicProductivityLoaded(data: result.data));
      case FailureResult<dynamic>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onSparePartsUsage(
    AdminSparePartsUsageRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.getSparePartsUsage();
    switch (result) {
      case Success<dynamic>():
        emit(AdminSparePartsUsageLoaded(data: result.data));
      case FailureResult<dynamic>():
        emit(AdminError(message: result.message));
    }
  }

  Future<void> _onDailyRevenue(
    AdminDailyRevenueRequested event,
    Emitter<AdminState> emit,
  ) async {
    emit(const AdminLoading());
    final result = await repository.getDailyRevenue();
    switch (result) {
      case Success<dynamic>():
        emit(AdminDailyRevenueLoaded(data: result.data));
      case FailureResult<dynamic>():
        emit(AdminError(message: result.message));
    }
  }
}
