import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/admin_service.dart';
import 'event.dart';
import 'state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminService service;

  AdminBloc({required this.service}) : super(const AdminInitial()) {
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

  Future<void> _onLoadUsers(AdminUsersLoadRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      final users = await service.getUsers(search: event.search, page: event.page);
      emit(AdminUsersLoaded(users: users));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onCreateUser(AdminUserCreateRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      final user = await service.createUser(event.request);
      emit(AdminUserCreated(user: user));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onDeleteUser(AdminUserDeleteRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      await service.deleteUser(event.id);
      emit(const AdminUserActionSuccess(message: 'User deleted successfully'));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onActivateUser(AdminUserActivateRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      await service.activateUser(event.id);
      emit(const AdminUserActionSuccess(message: 'User activated successfully'));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onDeactivateUser(AdminUserDeactivateRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      await service.deactivateUser(event.id);
      emit(const AdminUserActionSuccess(message: 'User deactivated successfully'));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onLoadSpareParts(AdminSparePartsLoadRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      final spareParts = await service.getSpareParts(search: event.search, page: event.page);
      emit(AdminSparePartsLoaded(spareParts: spareParts));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onLoadSparePart(AdminSparePartLoadRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      final sparePart = await service.getSparePart(event.id);
      emit(AdminSparePartLoaded(sparePart: sparePart));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onAddStock(AdminAddStockRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      await service.addStock(event.partId, event.quantity);
      emit(const AdminStockActionSuccess(message: 'Stock added successfully'));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onReduceStock(AdminReduceStockRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      await service.reduceStock(event.partId, event.quantity);
      emit(const AdminStockActionSuccess(message: 'Stock reduced successfully'));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onStockHistory(AdminStockHistoryRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      final history = await service.getStockHistory(event.partId);
      emit(AdminStockHistoryLoaded(history: history));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onDashboardSummary(AdminDashboardSummaryRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      final summary = await service.getDashboardSummary();
      emit(AdminDashboardLoaded(summary: summary));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onMonthlyRevenue(AdminMonthlyRevenueRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      final data = await service.getMonthlyRevenue();
      emit(AdminMonthlyRevenueLoaded(data: data));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onCompletedServices(AdminCompletedServicesRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      final data = await service.getCompletedServices();
      emit(AdminCompletedServicesLoaded(data: data));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onMechanicProductivity(AdminMechanicProductivityRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      final data = await service.getMechanicProductivity();
      emit(AdminMechanicProductivityLoaded(data: data));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onSparePartsUsage(AdminSparePartsUsageRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      final data = await service.getSparePartsUsage();
      emit(AdminSparePartsUsageLoaded(data: data));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }

  Future<void> _onDailyRevenue(AdminDailyRevenueRequested event, Emitter<AdminState> emit) async {
    emit(const AdminLoading());
    try {
      final data = await service.getDailyRevenue();
      emit(AdminDailyRevenueLoaded(data: data));
    } catch (e) {
      emit(AdminError(message: e.toString()));
    }
  }
}
