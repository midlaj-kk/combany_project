import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:auto_care_app/core/di/injection.dart';
import 'package:auto_care_app/core/network/dio_client.dart';
import 'package:auto_care_app/features/admin/data/datasources/admin_service.dart';
import 'package:auto_care_app/features/admin/domain/repositories/admin_repository.dart';
import 'package:auto_care_app/features/advisor/data/datasources/advisor_service.dart';
import 'package:auto_care_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:auto_care_app/features/cashier/data/datasources/cashier_service.dart';
import 'package:auto_care_app/features/mechanic/data/datasources/mechanic_service.dart';
import 'package:auto_care_app/main.dart';
import 'package:auto_care_app/features/auth/screen/login_screen.dart';
import 'package:auto_care_app/features/splash/screen/splash_screen.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await configureDependencies();
  });

  testWidgets('App boots to splash and routes to login', (tester) async {
    await tester.pumpWidget(const AutoCareApp());
    expect(find.byType(SplashScreen), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.text('Welcome Back'), findsOneWidget);
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
    expect(getIt<AdminRepository>(), isA<AdminRepository>());
  });
}
