import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:auto_care_app/core/constants/api_endpoints.dart';
import 'package:auto_care_app/core/di/injection.dart';
import 'package:auto_care_app/features/admin/models/quality_check_model.dart';
import 'package:auto_care_app/features/admin/services/admin_service.dart';
import 'package:auto_care_app/features/advisor/models/service_job_model.dart';
import 'package:auto_care_app/features/advisor/services/advisor_service.dart';
import 'package:auto_care_app/features/auth/services/auth_service.dart';
import 'package:auto_care_app/features/cashier/services/cashier_service.dart';

// Live-backend integration tests for the Admin Quality Check approve and
// send-for-rework actions. They drive the exact same code paths the
// QualityCheckScreen buttons use (AdminService.createQualityCheck) against
// the real Django backend and verify the job lands where it should:
//   approved  -> status ready_for_bill (Cashier "Ready for Billing" queue)
//   reworked  -> status rework_required (back to the Mechanic)
void main() {
  // Tests run against the live backend, so every job they create must be
  // removed at the end, otherwise the created jobs keep occupying the host
  // (the hosted backend has a single assigned mechanic).
  final createdJobIds = <int>[];

  // The hosted DB is re-seeded regularly, so bespoke ids can go stale.
  // Resolve the real vehicle and mechanic from the live API instead.
  late int vehicleId;
  late int mechanicId;

  Future<void> resolveLiveIds() async {
    final dio = getIt<Dio>();
    final vehicles = await dio.get(ApiEndpoints.vehicles);
    final mechanics = await dio.get(ApiEndpoints.mechanics);

    final vehicleRows = (vehicles.data['results'] as List)
        .cast<Map<String, dynamic>>();
    final mechanicRows = (mechanics.data['results'] as List)
        .cast<Map<String, dynamic>>();
    expect(vehicleRows, isNotEmpty, reason: 'need at least one live vehicle');
    expect(mechanicRows, isNotEmpty, reason: 'need at least one live mechanic');

    vehicleId = vehicleRows.first['id'] as int;
    mechanicId = mechanicRows.first['id'] as int;
  }

  Future<int> makeQcJob(String complaint, {int? mechanicOverride}) async {
    final advisor = getIt<AdvisorService>();
    final created = await advisor.createJob(ServiceJobCreateRequest(
      vehicle: vehicleId,
      complaint: complaint,
      serviceType: 'test',
    ));
    await advisor.assignMechanic(
        created.id, mechanicOverride ?? mechanicId);
    if (created.status != ServiceJobStatus.inProgress) {
      await advisor.updateJobStatus(created.id, 'in_progress');
    }
    await advisor.updateJobStatus(created.id, 'qc_pending');
    createdJobIds.add(created.id);
    return created.id;
  }

  Future<int> currentStatus(int jobId) async {
    final refreshed = await getIt<AdvisorService>().getJob(jobId);
    return refreshed.status!.index;
  }

  tearDown(() async {
    final dio = getIt<Dio>();
    for (final jobId in createdJobIds) {
      try {
        await dio.delete(ApiEndpoints.serviceJobById(jobId));
      } catch (_) {
        // already gone - nothing to do
      }
    }
    createdJobIds.clear();
  });

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Let real network calls reach the live backend instead of the
    // test binding's mocked HttpClient (which stubs every request as 400).
    HttpOverrides.global = null;
    SharedPreferences.setMockInitialValues({});
    await configureDependencies();
    // Needed before _resolveLiveIds() so the dio has a token for /vehicles/.
    final auth = getIt<AuthService>();
    await auth.login(email: 'admin@autocare.com', password: 'admin123');
    await resolveLiveIds();
  });

  test('admin approve moves job to ready_for_bill for the cashier',
      () async {
    final auth = getIt<AuthService>();
    final user = await auth.login(
        email: 'admin@autocare.com', password: 'admin123');
    expect(user, isNotNull);
    expect(user!.role.name, 'admin');

    final jobId = await makeQcJob('approve-e2e');

    final qc = await getIt<AdminService>().createQualityCheck(
        QualityCheckCreateRequest(
          serviceJob: jobId,
          brakeCheck: TestDriveEnum.passed,
          engineCheck: TestDriveEnum.passed,
          oilLeakageCheck: OilLeakageCheckEnum.noIssue,
          acCheck: TestDriveEnum.passed,
          tyreCheck: TestDriveEnum.passed,
          testDrive: TestDriveEnum.passed,
          overallStatus: OverallStatusEnum.approved,
        ));
    expect(qc.overallStatus, OverallStatusEnum.approved,
        reason: 'QC record should be stored as approved');

    expect(
        await currentStatus(jobId), ServiceJobStatus.readyForBill.index,
        reason:
            'approving a QC must move the job to ready_for_bill in the DB');

    final readyJobs = await getIt<CashierService>().getReadyForBillingJobs();
    expect(readyJobs.map((j) => j.id), contains(jobId),
        reason:
            'approved job must appear in the Cashier Ready for Billing queue');
  });

  test('admin send for rework moves job back to the mechanic', () async {
    final auth = getIt<AuthService>();
    final user = await auth.login(
        email: 'admin@autocare.com', password: 'admin123');
    expect(user, isNotNull);
    expect(user!.role.name, 'admin');

    final jobId = await makeQcJob('rework-e2e');

    final qc = await getIt<AdminService>().createQualityCheck(
        QualityCheckCreateRequest(
          serviceJob: jobId,
          brakeCheck: TestDriveEnum.failed,
          engineCheck: TestDriveEnum.failed,
          oilLeakageCheck: OilLeakageCheckEnum.issueFound,
          acCheck: TestDriveEnum.failed,
          tyreCheck: TestDriveEnum.failed,
          testDrive: TestDriveEnum.failed,
          overallStatus: OverallStatusEnum.reworkRequired,
        ));
    expect(qc.overallStatus, OverallStatusEnum.reworkRequired,
        reason: 'QC record should be stored as rework_required');

    expect(
        await currentStatus(jobId), ServiceJobStatus.reworkRequired.index,
        reason:
            'sending a QC for rework must move the job to rework_required in the DB');

    final refreshed = await getIt<AdvisorService>().getJob(jobId);
    expect(refreshed.mechanicName, isNotNull,
        reason:
            'job must stay assigned to the mechanic so it shows in their Rework tab');
  });
}
