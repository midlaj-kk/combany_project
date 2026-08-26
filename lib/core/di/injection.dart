import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/dio_client.dart';
import '../../features/authentication/data/datasources/auth_local_datasource.dart';
import '../../features/authentication/data/datasources/auth_remote_datasource.dart';
import '../../features/authentication/data/repository/auth_repository_impl.dart';
import '../../features/authentication/domain/repositories/auth_repository.dart';
import '../../features/authentication/presentation/bloc/auth_bloc.dart';

import '../../features/admin/data/datasources/admin_service.dart';
import '../../features/admin/data/repository/admin_repository_impl.dart';
import '../../features/admin/domain/repositories/admin_repository.dart';
import '../../features/admin/presentation/bloc/admin_bloc.dart';

import '../../features/advisor/data/datasources/advisor_service.dart';
import '../../features/advisor/data/repository/customer_repository_impl.dart';
import '../../features/advisor/data/repository/vehicle_repository_impl.dart';
import '../../features/advisor/data/repository/job_repository_impl.dart';
import '../../features/advisor/domain/repositories/customer_repository.dart';
import '../../features/advisor/domain/repositories/vehicle_repository.dart';
import '../../features/advisor/domain/repositories/job_repository.dart';
import '../../features/advisor/presentation/bloc/customer_bloc.dart';
import '../../features/advisor/presentation/bloc/vehicle_bloc.dart';
import '../../features/advisor/presentation/bloc/job_bloc.dart';

import '../../features/mechanic/data/datasources/mechanic_service.dart';
import '../../features/mechanic/data/repository/mechanic_repository_impl.dart';
import '../../features/mechanic/domain/repositories/mechanic_repository.dart';
import '../../features/mechanic/presentation/bloc/mechanic_bloc.dart';

import '../../features/cashier/data/datasources/cashier_service.dart';
import '../../features/cashier/data/repository/billing_repository_impl.dart';
import '../../features/cashier/domain/repositories/billing_repository.dart';
import '../../features/cashier/presentation/bloc/billing_bloc.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<Dio>(() => getIt<DioClient>().dio);

  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: getIt()),
  );
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dioClient: getIt()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(authRepository: getIt()),
  );

  getIt.registerLazySingleton<AdminService>(
    () => AdminService(dio: getIt()),
  );
  getIt.registerLazySingleton<AdminRepository>(
    () => AdminRepositoryImpl(service: getIt()),
  );
  getIt.registerFactory<AdminBloc>(
    () => AdminBloc(repository: getIt()),
  );

  getIt.registerLazySingleton<AdvisorService>(
    () => AdvisorService(dio: getIt()),
  );

  getIt.registerLazySingleton<CustomerRepository>(
    () => CustomerRepositoryImpl(service: getIt()),
  );
  getIt.registerLazySingleton<VehicleRepository>(
    () => VehicleRepositoryImpl(service: getIt()),
  );
  getIt.registerLazySingleton<JobRepository>(
    () => JobRepositoryImpl(service: getIt()),
  );

  getIt.registerFactory<CustomerBloc>(
    () => CustomerBloc(repository: getIt()),
  );
  getIt.registerFactory<VehicleBloc>(
    () => VehicleBloc(repository: getIt()),
  );
  getIt.registerFactory<JobBloc>(
    () => JobBloc(repository: getIt()),
  );

  getIt.registerLazySingleton<MechanicService>(
    () => MechanicService(dio: getIt()),
  );
  getIt.registerLazySingleton<MechanicRepository>(
    () => MechanicRepositoryImpl(service: getIt()),
  );
  getIt.registerFactory<MechanicBloc>(
    () => MechanicBloc(repository: getIt()),
  );

  getIt.registerLazySingleton<CashierService>(
    () => CashierService(dio: getIt()),
  );
  getIt.registerLazySingleton<BillingRepository>(
    () => BillingRepositoryImpl(service: getIt()),
  );
  getIt.registerFactory<BillingBloc>(
    () => BillingBloc(repository: getIt()),
  );

  _setupAuthInterceptor();
}

void _setupAuthInterceptor() {
  final localDataSource = getIt<AuthLocalDataSource>();

  AuthInterceptor.getToken = () {
    final prefs = getIt<SharedPreferences>();
    return prefs.getString('access_token') ?? '';
  };

  AuthInterceptor.getRefreshToken = () {
    final prefs = getIt<SharedPreferences>();
    return prefs.getString('refresh_token') ?? '';
  };

  AuthInterceptor.setTokens = (String newAccess) async {
    await localDataSource.saveTokens(
      access: newAccess,
      refresh: getIt<SharedPreferences>().getString('refresh_token') ?? '',
    );
  };

  AuthInterceptor.clearTokens = () async {
    await localDataSource.clearTokens();
  };
}
