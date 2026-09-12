import '../config/api_config.dart';

// All the API paths used in the app.
//
// The version is added from ApiConfig.apiVersion (for example "/api/v1"),
// and we use it to build every endpoint here.
class ApiEndpoints {
  ApiEndpoints._();

  static const String _v1 = ApiConfig.apiVersion;

  // Auth
  static const String login = '$_v1/auth/login/';
  static const String logout = '$_v1/auth/logout/';
  static const String me = '$_v1/auth/me/';
  static const String refreshToken = '$_v1/auth/refresh/';

  // Users
  static const String users = '$_v1/users/';
  static String userById(int id) => '$_v1/users/$id/';
  static String userActivate(int id) => '$_v1/users/$id/activate/';

  // Customers
  static const String customers = '$_v1/customers/';
  static String customerById(int id) => '$_v1/customers/$id/';
  static String customerHistory(int id) => '$_v1/customers/$id/history/';
  static String customerVehicles(int id) => '$_v1/customers/$id/vehicles/';

  // Vehicles
  static const String vehicles = '$_v1/vehicles/';
  static String vehicleById(int id) => '$_v1/vehicles/$id/';
  static String vehicleHistoryById(int id) => '$_v1/vehicles/$id/history/';

  // Service Jobs
  static const String serviceJobs = '$_v1/service-jobs/';
  static String serviceJobById(int id) => '$_v1/service-jobs/$id/';
  static String assignMechanic(int id) => '$_v1/service-jobs/$id/assign_mechanic/';
  static String changeMechanic(int id) => '$_v1/service-jobs/$id/change_mechanic/';
  static String serviceJobStatus(int id) => '$_v1/service-jobs/$id/status/';

  // Works
  static const String works = '$_v1/works/';
  static String workById(int id) => '$_v1/works/$id/';
  static String workStatus(int id) => '$_v1/works/$id/status/';

  // Parts Used
  static const String partsUsed = '$_v1/parts-used/';
  static String partsUsedById(int id) => '$_v1/parts-used/$id/';

  // Spare Parts
  static const String spareParts = '$_v1/spare-parts/';
  static String sparePartById(int id) => '$_v1/spare-parts/$id/';
  static String addStock(int id) => '$_v1/spare-parts/$id/add_stock/';
  static String reduceStock(int id) => '$_v1/spare-parts/$id/reduce_stock/';
  static String stockHistory(int id) => '$_v1/spare-parts/$id/stock_history/';
  static const String lowStock = '$_v1/spare-parts/low_stock/';

  // Bills
  static const String bills = '$_v1/bills/';
  static String billById(int id) => '$_v1/bills/$id/';

  // Mechanics
  static const String mechanics = '$_v1/mechanics/';

  // Deliveries
  static const String deliveries = '$_v1/delivery/';
  static String deliveryById(int id) => '$_v1/delivery/$id/';
  static const String readyForDelivery = '$_v1/delivery/ready/';
  static const String delivered = '$_v1/delivery/delivered/';

  // Quality Checks
  static const String qualityChecks = '$_v1/quality-checks/';
  static String qualityCheckById(int id) => '$_v1/quality-checks/$id/';

  // Dashboard
  static const String dashboardSummary = '$_v1/dashboard/summary/';

  // Reports
  static const String monthlyRevenue = '$_v1/reports/monthly-revenue/';
  static const String completedServices = '$_v1/reports/completed-services/';
  static const String mechanicProductivity = '$_v1/reports/mechanic-productivity/';
  static const String sparePartsUsage = '$_v1/reports/spare-parts-usage/';
  static const String dailyRevenue = '$_v1/reports/daily-revenue/';
  static const String pendingPaymentsSummary = '$_v1/reports/pending-payments/';
}
