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
import 'package:auto_care_app/features/auth/services/auth_service.dart';

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

  test('auth tokens are persisted in SharedPreferences', () async {
    final authService = getIt<AuthService>();
    final prefs = getIt<SharedPreferences>();

    expect(await authService.isLoggedIn(), isFalse);

    await authService.saveTokens(
      access: 'test-access-token',
      refresh: 'test-refresh-token',
    );

    expect(await authService.isLoggedIn(), isTrue);
    expect(await authService.getAccessToken(), 'test-access-token');
    expect(await authService.getRefreshToken(), 'test-refresh-token');

    expect(prefs.getString('access_token'), 'test-access-token');
    expect(prefs.getString('refresh_token'), 'test-refresh-token');

    await authService.logout();

    expect(await authService.isLoggedIn(), isFalse);
    expect(prefs.getString('access_token'), isNull);
    expect(prefs.getString('refresh_token'), isNull);
  });
}
