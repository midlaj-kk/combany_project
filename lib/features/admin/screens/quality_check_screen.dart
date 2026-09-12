import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../advisor/models/service_job_model.dart';
import '../../advisor/bloc/job_bloc.dart';
import '../services/admin_service.dart';
import '../models/quality_check_model.dart';
import '../widgets/checklist_row.dart';

class QualityCheckScreen extends StatefulWidget {
  const QualityCheckScreen({super.key, required this.serviceJobId});

  final int serviceJobId;

  @override
  State<QualityCheckScreen> createState() => _QualityCheckScreenState();
}

class _QualityCheckScreenState extends State<QualityCheckScreen> {
  bool _isSubmitting = false;
  String? _errorMessage;

  final Map<String, String?> _checklist = {
    'brake_check': null,
    'engine_check': null,
    'oil_leakage_check': null,
    'ac_check': null,
    'tyre_check': null,
    'test_drive': null,
  };

  void _setChecklistValue(String key, String value) {
    setState(() => _checklist[key] = value);
  }

  bool get _isChecklistComplete =>
      _checklist.values.every((v) => v != null);

  TestDriveEnum _mapTestDriveValue(String value) {
    switch (value) {
      case 'passed':
        return TestDriveEnum.passed;
      case 'failed':
        return TestDriveEnum.failed;
      case 'na':
        return TestDriveEnum.na;
      default:
        return TestDriveEnum.na;
    }
  }

  OilLeakageCheckEnum _mapOilLeakageValue(String value) {
    switch (value) {
      case 'no_issue':
        return OilLeakageCheckEnum.noIssue;
      case 'issue_found':
        return OilLeakageCheckEnum.issueFound;
      case 'na':
        return OilLeakageCheckEnum.na;
      default:
        return OilLeakageCheckEnum.na;
    }
  }

  Future<void> _submit(String overallStatus) async {
    if (!_isChecklistComplete) {
      setState(() =>
          _errorMessage = 'Please complete every checklist item first');
      return;
    }

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    try {
      final adminService = getIt<AdminService>();
      await adminService.createQualityCheck(QualityCheckCreateRequest(
        serviceJob: widget.serviceJobId,
        brakeCheck: _mapTestDriveValue(_checklist['brake_check']!),
        engineCheck: _mapTestDriveValue(_checklist['engine_check']!),
        oilLeakageCheck:
            _mapOilLeakageValue(_checklist['oil_leakage_check']!),
        acCheck: _mapTestDriveValue(_checklist['ac_check']!),
        tyreCheck: _mapTestDriveValue(_checklist['tyre_check']!),
        testDrive: _mapTestDriveValue(_checklist['test_drive']!),
        overallStatus: overallStatus == 'approved'
            ? OverallStatusEnum.approved
            : OverallStatusEnum.reworkRequired,
      ));
      if (!mounted) return;

      // Reload the job from the backend so the page shows the latest
      // status (ready_for_bill / rework_required) after the action.
      context.read<JobBloc>().add(JobLoadRequested(id: widget.serviceJobId));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quality check submitted')),
      );
      Navigator.of(context).maybePop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _errorMessage = e.toString());
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<JobBloc, JobState>(
          builder: (context, state) {
            if (state is JobLoading || state is JobInitial) {
              return const Center(
                child: CircularProgressIndicator(
                    color: AppColors.limeAccent),
              );
            }
            if (state is JobError) {
              return Center(
                child: Text(state.message,
                    style: AppTextStyles.bodySecondary),
              );
            }
            if (state is JobLoaded) {
              final job = state.job;
              return _buildContent(context, job);
            }
            return const Center(
              child: CircularProgressIndicator(
                  color: AppColors.limeAccent),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ServiceJobModel job) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () =>
                          Navigator.of(context).maybePop(),
                      icon: const Icon(Icons.arrow_back,
                          color: AppColors.textPrimary),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text('Admin - Quality Check',
                              style: AppTextStyles.heading3),
                          Text(
                            job.jobNumber,
                            style: AppTextStyles.caption.copyWith(
                                color: AppColors.limeAccent),
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.inputFill,
                      child: Icon(Icons.person,
                          size: 16, color: AppColors.textMuted),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.limeAccent
                              .withValues(alpha: 0.15),
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                        child: const Icon(
                            Icons.directions_car_filled,
                            color: AppColors.limeAccent),
                      ),
                      const SizedBox(height: 14),
                      _InfoLine(
                        label: 'VEHICLE NUMBER',
                        value: job.vehicleNumber ?? '',
                        valueColor: AppColors.limeAccent,
                      ),
                      const SizedBox(height: 10),
                      _InfoLine(
                        label: 'BRAND/MODEL',
                        value: job.vehicleModel ?? job.serviceType,
                      ),
                      const SizedBox(height: 10),
                      _InfoLine(
                        label: 'CUSTOMER',
                        value: job.customerName ?? '',
                      ),
                      const SizedBox(height: 10),
                      _InfoLine(
                        label: 'MECHANIC',
                        value: job.mechanicName ?? '',
                      ),
                      const SizedBox(height: 10),
                      _InfoLine(
                        label: 'CUSTOMER COMPLAINT',
                        value: job.complaint.isEmpty
                            ? 'No complaint recorded.'
                            : job.complaint,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'INSPECTION CHECKLIST',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.limeAccent,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 10),
                ChecklistRow(
                  label: 'Brake Check',
                  selectedValue: _checklist['brake_check'],
                  onChanged: (v) =>
                      _setChecklistValue('brake_check', v),
                ),
                ChecklistRow(
                  label: 'Engine Check',
                  selectedValue: _checklist['engine_check'],
                  onChanged: (v) =>
                      _setChecklistValue('engine_check', v),
                ),
                ChecklistRow(
                  label: 'Oil Leakage Check',
                  selectedValue:
                      _checklist['oil_leakage_check'],
                  options: const [
                    'no_issue',
                    'issue_found',
                    'na'
                  ],
                  displayLabels: const [
                    'NO ISSUE',
                    'ISSUE',
                    'N/A'
                  ],
                  onChanged: (v) => _setChecklistValue(
                      'oil_leakage_check', v),
                ),
                ChecklistRow(
                  label: 'AC Check',
                  selectedValue: _checklist['ac_check'],
                  onChanged: (v) =>
                      _setChecklistValue('ac_check', v),
                ),
                ChecklistRow(
                  label: 'Tyre Check',
                  selectedValue: _checklist['tyre_check'],
                  onChanged: (v) =>
                      _setChecklistValue('tyre_check', v),
                ),
                ChecklistRow(
                  label: 'Test Drive',
                  selectedValue: _checklist['test_drive'],
                  onChanged: (v) =>
                      _setChecklistValue('test_drive', v),
                ),
                if (_errorMessage != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    _errorMessage!,
                    style: const TextStyle(
                        color: AppColors.statusError,
                        fontSize: 13),
                  ),
                ],
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _isSubmitting
                      ? null
                      : () => _submit('approved'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.statusSuccess,
                    minimumSize: const Size.fromHeight(52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: const Icon(Icons.check_circle_outline,
                      color: Colors.black),
                  label: const Text('Approve',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _isSubmitting
                      ? null
                      : () =>
                          _submit('rework_required'),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        color: AppColors.statusError),
                    minimumSize: const Size.fromHeight(52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: const Icon(Icons.replay,
                      color: AppColors.statusError, size: 18),
                  label: const Text('Send for Rework',
                      style: TextStyle(
                          color: AppColors.statusError,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style:
                AppTextStyles.caption.copyWith(letterSpacing: 0.5)),
        const SizedBox(height: 2),
        Text(
          value,
          style: AppTextStyles.bodyRegular.copyWith(
            fontWeight: FontWeight.bold,
            color: valueColor ?? AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
