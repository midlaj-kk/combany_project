import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:auto_care_app/core/di/injection.dart';
import 'package:auto_care_app/core/network/dio_client.dart';
import 'package:auto_care_app/features/admin/services/admin_service.dart';
import 'package:auto_care_app/features/advisor/services/advisor_service.dart';
import 'package:auto_care_app/features/mechanic/services/mechanic_service.dart';
import 'package:auto_care_app/features/cashier/services/cashier_service.dart';
import 'package:auto_care_app/features/auth/bloc/bloc.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await configureDependencies();
  });

  test('GetIt resolves configured Dio shared by all services', () {
    final dio = getIt<Dio>();
    expect(dio, same(getIt<DioClient>().dio));
    expect(dio.options.baseUrl, isNotEmpty);
    expect(dio.interceptors.whereType<AuthInterceptor>(), isNotEmpty);
  });

  test('GetIt resolves every feature service without throwing', () {
    expect(getIt<AdminService>(), isA<AdminService>());
    expect(getIt<AdvisorService>(), isA<AdvisorService>());
    expect(getIt<MechanicService>(), isA<MechanicService>());
    expect(getIt<CashierService>(), isA<CashierService>());
    expect(getIt<AuthBloc>(), isA<AuthBloc>());
  });
}
