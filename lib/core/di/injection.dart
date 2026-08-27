import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/dio_client.dart';
import '../../features/auth/services/auth_service.dart';
import '../../features/auth/bloc/bloc.dart';

import '../../features/admin/services/admin_service.dart';
import '../../features/admin/bloc/bloc.dart';

import '../../features/advisor/services/advisor_service.dart';
import '../../features/advisor/bloc/customer_bloc.dart';
import '../../features/advisor/bloc/vehicle_bloc.dart';
import '../../features/advisor/bloc/job_bloc.dart';

import '../../features/mechanic/services/mechanic_service.dart';
import '../../features/mechanic/bloc/bloc.dart';

import '../../features/cashier/services/cashier_service.dart';
import '../../features/cashier/bloc/bloc.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<Dio>(() => getIt<DioClient>().dio);

  // Auth
  getIt.registerLazySingleton<AuthService>(
    () => AuthService(dioClient: getIt(), prefs: getIt()),
  );
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(authService: getIt()),
  );

  // Admin
  getIt.registerLazySingleton<AdminService>(
    () => AdminService(dio: getIt()),
  );
  getIt.registerFactory<AdminBloc>(
    () => AdminBloc(service: getIt()),
  );

  // Advisor
  getIt.registerLazySingleton<AdvisorService>(
    () => AdvisorService(dio: getIt()),
  );
  getIt.registerFactory<CustomerBloc>(
    () => CustomerBloc(service: getIt()),
  );
  getIt.registerFactory<VehicleBloc>(
    () => VehicleBloc(service: getIt()),
  );
  getIt.registerFactory<JobBloc>(
    () => JobBloc(service: getIt()),
  );

  // Mechanic
  getIt.registerLazySingleton<MechanicService>(
    () => MechanicService(dio: getIt()),
  );
  getIt.registerFactory<MechanicBloc>(
    () => MechanicBloc(service: getIt()),
  );

  // Cashier
  getIt.registerLazySingleton<CashierService>(
    () => CashierService(dio: getIt()),
  );
  getIt.registerFactory<BillingBloc>(
    () => BillingBloc(service: getIt()),
  );

  _setupAuthInterceptor();
}

void _setupAuthInterceptor() {
  final authService = getIt<AuthService>();

  AuthInterceptor.getToken = () {
    return authService.getAccessToken() ?? '';
  };

  AuthInterceptor.getRefreshToken = () {
    return authService.getRefreshToken() ?? '';
  };

  AuthInterceptor.setTokens = (String newAccess) async {
    await authService.saveTokens(
      access: newAccess,
      refresh: authService.getRefreshToken() ?? '',
    );
  };

  AuthInterceptor.clearTokens = () async {
    await authService.logout();
  };
}
