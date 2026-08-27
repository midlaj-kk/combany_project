import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/admin/models/user_model.dart';
import '../../features/admin/bloc/bloc.dart';
import '../../features/admin/screens/add_mechanic_screen.dart';
import '../../features/admin/screens/admin_dashboard_screen.dart';
import '../../features/admin/screens/inventory_list_screen.dart';
import '../../features/admin/screens/quality_check_screen.dart';
import '../../features/admin/screens/reports_screen.dart';
import '../../features/admin/screens/staff_management_screen.dart';
import '../../features/admin/screens/stock_history_screen.dart';
import '../../features/advisor/bloc/customer_bloc.dart';
import '../../features/advisor/bloc/job_bloc.dart';
import '../../features/advisor/bloc/vehicle_bloc.dart';
import '../../features/advisor/screens/add_customer_screen.dart';
import '../../features/advisor/screens/advisor_home_screen.dart';
import '../../features/advisor/screens/create_service_job_screen.dart';
import '../../features/advisor/screens/customer_list_screen.dart';
import '../../features/advisor/screens/job_detail_advisor_screen.dart';
import '../../features/advisor/screens/vehicle_detail_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/cashier/bloc/bloc.dart';
import '../../features/cashier/screens/cashier_home_screen.dart';
import '../../features/cashier/screens/create_bill_screen.dart';
import '../../features/cashier/screens/delivery_ready_screen.dart';
import '../../features/cashier/screens/complete_delivery_screen.dart';
import '../../features/cashier/screens/pending_payments_screen.dart';
import '../../features/cashier/screens/record_payment_screen.dart';
import '../../features/mechanic/bloc/bloc.dart';
import '../../features/mechanic/screens/job_detail_mechanic_screen.dart';
import '../../features/mechanic/screens/mechanic_home_screen.dart';
import '../../features/mechanic/screens/mechanic_profile_screen.dart';
import '../di/injection.dart';

class AppRouter {
  AppRouter._();

  /// Tracks route changes so kept-alive screens (like Advisor Home) can
  /// refresh their data when a pushed screen above them is popped.
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  static void afterLogin(BuildContext context, UserRole role) {
    resetToRoleHome(context, _homeForRole(role));
  }

  static Widget _homeForRole(UserRole role) {
    return switch (role) {
      UserRole.serviceAdvisor => BlocProvider(
        create: (_) => getIt<JobBloc>()..add(const JobsLoadRequested()),
        child: const AdvisorHomeScreen(),
      ),
      UserRole.mechanic => _mechanicHome(),
      UserRole.cashier => BlocProvider(
        create: (_) => getIt<BillingBloc>(),
        child: const CashierHomeScreen(),
      ),
      UserRole.admin => const AdminDashboardScreen(),
    };
  }

  static Widget _mechanicHome() {
    return BlocProvider(
      create: (_) => getIt<JobBloc>()..add(const JobsLoadRequested()),
      child: const MechanicHomeScreen(),
    );
  }

  static void resetToRoleHome(BuildContext context, Widget screen) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => screen),
      (route) => false,
    );
  }

  static void resetToAdminHome(BuildContext context) =>
      resetToRoleHome(context, const AdminDashboardScreen());

  static void resetToAdvisorHome(BuildContext context) =>
      resetToRoleHome(
        context,
        BlocProvider(
          create: (_) => getIt<JobBloc>()..add(const JobsLoadRequested()),
          child: const AdvisorHomeScreen(),
        ),
      );

  static void resetToCashierHome(BuildContext context) =>
      resetToRoleHome(
        context,
        BlocProvider(
          create: (_) => getIt<BillingBloc>(),
          child: const CashierHomeScreen(),
        ),
      );

  static void resetToMechanicHome(BuildContext context) =>
      resetToRoleHome(context, _mechanicHome());

  static void resetToMechanicProfile(BuildContext context) =>
      resetToRoleHome(context, const MechanicProfileScreen());

  // ── Auth ──────────────────────────────────────────────────────

  static void toLogin(BuildContext context, {bool replace = false}) {
    if (replace) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    } else {
      _push(context, const LoginScreen());
    }
  }

  // ── Admin ─────────────────────────────────────────────────────

  static void toAddMechanic(BuildContext context) {
    _push(
      context,
      BlocProvider(
        create: (_) => getIt<AdminBloc>(),
        child: const AddMechanicScreen(),
      ),
    );
  }

  static void toInventory(BuildContext context) {
    _push(
      context,
      BlocProvider(
        create: (_) => getIt<AdminBloc>(),
        child: const InventoryListScreen(),
      ),
    );
  }

  static void toReports(BuildContext context) {
    _push(
      context,
      BlocProvider(
        create: (_) => getIt<AdminBloc>(),
        child: const ReportsScreen(),
      ),
    );
  }

  static void toQualityCheck(BuildContext context, {required int serviceJobId}) {
    _push(
      context,
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<AdminBloc>(),
          ),
          BlocProvider(
            create: (_) => getIt<JobBloc>()..add(JobLoadRequested(id: serviceJobId)),
          ),
        ],
        child: QualityCheckScreen(serviceJobId: serviceJobId),
      ),
    );
  }

  static void toStaffManagement(BuildContext context) {
    _push(
      context,
      BlocProvider(
        create: (_) => getIt<AdminBloc>(),
        child: const StaffManagementScreen(),
      ),
    );
  }

  static void toStockHistory(BuildContext context, {required int partId}) {
    _push(
      context,
      BlocProvider(
        create: (_) => getIt<AdminBloc>(),
        child: StockHistoryScreen(partId: partId),
      ),
    );
  }

  // ── Service Advisor ───────────────────────────────────────────

  static void toCustomerList(BuildContext context) {
    _push(
      context,
      BlocProvider(
        create: (_) => getIt<CustomerBloc>(),
        child: const CustomerListScreen(),
      ),
    );
  }

  static void toJobDetailAdvisor(BuildContext context, {required int jobId}) {
    _push(
      context,
      BlocProvider(
        create: (_) => getIt<JobBloc>()..add(JobLoadRequested(id: jobId)),
        child: JobDetailAdvisorScreen(jobId: jobId),
      ),
    );
  }

  static Future<void> toAddCustomer(BuildContext context) {
    return _push(
      context,
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<CustomerBloc>()),
          BlocProvider(create: (_) => getIt<VehicleBloc>()),
          BlocProvider(create: (_) => getIt<JobBloc>()),
        ],
        child: const AddCustomerScreen(),
      ),
    );
  }

  static Future<void> toVehicleDetail(BuildContext context, {required int vehicleId}) {
    return _push(
      context,
      BlocProvider(
        create: (_) => getIt<VehicleBloc>()
          ..add(VehicleLoadRequested(id: vehicleId))
          ..add(VehicleHistoryLoadRequested(vehicleId: vehicleId)),
        child: VehicleDetailScreen(vehicleId: vehicleId),
      ),
    );
  }

  static void toCreateServiceJob(
    BuildContext context, {
    required int vehicleId,
    required String vehicleLabel,
    required String customerName,
  }) {
    _push(
      context,
      BlocProvider(
        create: (_) => getIt<JobBloc>(),
        child: CreateServiceJobScreen(
          vehicleId: vehicleId,
          vehicleLabel: vehicleLabel,
          customerName: customerName,
        ),
      ),
    );
  }

  // ── Mechanic ──────────────────────────────────────────────────

  static void toJobDetailMechanic(BuildContext context, {required int jobId}) {
    _push(
      context,
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                getIt<JobBloc>()..add(JobLoadRequested(id: jobId)),
          ),
          BlocProvider(create: (_) => getIt<MechanicBloc>()),
        ],
        child: JobDetailMechanicScreen(jobId: jobId),
      ),
    );
  }

  // ── Cashier ───────────────────────────────────────────────────

  static void toPendingPayments(BuildContext context) {
    _push(
      context,
      BlocProvider(
        create: (_) => getIt<BillingBloc>(),
        child: const PendingPaymentsScreen(),
      ),
    );
  }

  static void toDeliveryReady(BuildContext context) {
    _push(
      context,
      BlocProvider(
        create: (_) => getIt<BillingBloc>(),
        child: const DeliveryReadyScreen(),
      ),
    );
  }

  static void toCreateBill(
    BuildContext context, {
    required int jobId,
    required String jobNumber,
    required String vehicleLabel,
    required String vehicleModel,
    required String customerName,
  }) {
    _push(
      context,
      BlocProvider(
        create: (_) => getIt<BillingBloc>(),
        child: CreateBillScreen(
          jobId: jobId,
          jobNumber: jobNumber,
          vehicleLabel: vehicleLabel,
          vehicleModel: vehicleModel,
          customerName: customerName,
        ),
      ),
    );
  }

  static void toRecordPayment(BuildContext context, {required int billId}) {
    _push(
      context,
      BlocProvider(
        create: (_) => getIt<BillingBloc>(),
        child: RecordPaymentScreen(billId: billId),
      ),
    );
  }

  static void toCompleteDelivery(
    BuildContext context, {
    required int jobId,
    required String jobNumber,
    required String vehicleLabel,
    required String customerName,
  }) {
    _push(
      context,
      BlocProvider(
        create: (_) => getIt<BillingBloc>(),
        child: CompleteDeliveryScreen(
          jobId: jobId,
          jobNumber: jobNumber,
          vehicleLabel: vehicleLabel,
          customerName: customerName,
        ),
      ),
    );
  }

  // ──────────────────────────────────────────────────────────────

  static Future<void> _push(BuildContext context, Widget screen, {bool replace = false}) {
    final route = MaterialPageRoute<void>(builder: (_) => screen);
    if (replace) {
      return Navigator.of(context).pushReplacement(route);
    }
    return Navigator.of(context).push(route);
  }
}
