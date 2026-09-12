import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/role_bottom_nav.dart';
import '../../../widgets/common/status_badge.dart';
import '../../advisor/bloc/job_bloc.dart';
import '../../advisor/models/service_job_model.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';
import '../models/service_work_model.dart';
import '../models/part_used_model.dart';
import '../widgets/part_used_item.dart';
import '../widgets/service_work_item.dart';
import '../widgets/add_part_used_sheet.dart';
import '../widgets/add_service_work_sheet.dart';


class JobDetailMechanicScreen extends StatefulWidget {
  const JobDetailMechanicScreen({super.key, required this.jobId});

  final int jobId;

  @override
  State<JobDetailMechanicScreen> createState() =>
      _JobDetailMechanicScreenState();
}

class _JobDetailMechanicScreenState extends State<JobDetailMechanicScreen> {
  ServiceJobModel? _job;
  List<ServiceWorkModel> _workItems = [];
  List<PartUsedModel> _partsUsed = [];

  bool _isSubmittingQc = false;
  bool _isStartingWork = false;
  String? _errorMessage;

  double get _totalLabour => _workItems.fold(
      0,
      (sum, w) =>
          sum + (double.tryParse(w.labourCharge ?? '0') ?? 0));

  double get _totalParts => _partsUsed.fold(
      0,
      (sum, p) =>
          sum +
          ((double.tryParse(p.price ?? '0') ?? 0) *
              (double.tryParse(p.quantity) ?? 0)));

  bool get _allWorkCompleted =>
      _workItems.isNotEmpty &&
      _workItems.every((w) => w.status == ServiceWorkStatus.completed);

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    context.read<JobBloc>().add(JobLoadRequested(id: widget.jobId));
    context
        .read<MechanicBloc>()
        .add(MechanicWorksLoadRequested(serviceJob: widget.jobId));
    context
        .read<MechanicBloc>()
        .add(MechanicPartsUsedLoadRequested(serviceJob: widget.jobId));
  }

  void _onJobStateChanged(BuildContext context, JobState state) {
    if (state is JobLoaded) {
      setState(() {
        _job = state.job;
        _errorMessage = null;
      });
    } else if (state is JobError) {
      setState(() {
        _errorMessage = state.message;
        _isStartingWork = false;
        _isSubmittingQc = false;
      });
    } else if (state is JobUpdated) {
      // The status PATCH already returned the fresh job, so we apply it
      // directly instead of re-fetching the job and the work/part lists.
      // This makes the loading disappear right away and skips 3 extra API
      // calls. A status change does not change works or parts.
      final sentForQc =
          _isSubmittingQc && state.job.status == ServiceJobStatus.qcPending;
      setState(() {
        _job = state.job;
        _errorMessage = null;
        _isStartingWork = false;
        _isSubmittingQc = false;
      });
      if (sentForQc) {
        // QC submission succeeded: confirm it and go back to My Jobs. The
        // home screen reloads itself (RouteAware/didPopNext), so the job
        // leaves the active list and the counters update immediately.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Job sent for quality check'),
            backgroundColor: AppColors.statusSuccess,
          ),
        );
        Navigator.of(context).maybePop();
      }
    }
  }

  void _onMechanicStateChanged(BuildContext context, MechanicState state) {
    if (state is MechanicWorksLoaded) {
      setState(() {
        _workItems = state.works.results;
        _errorMessage = null;
      });
    } else if (state is MechanicPartsUsedLoaded) {
      setState(() {
        _partsUsed = state.partsUsed.results;
        _errorMessage = null;
      });
    } else if (state is MechanicError) {
      setState(() {
        _errorMessage = state.message;
      });
    } else if (state is MechanicWorkUpdated) {
      context
          .read<MechanicBloc>()
          .add(MechanicWorksLoadRequested(serviceJob: widget.jobId));
    } else if (state is MechanicPartUsedDeleted) {
      context
          .read<MechanicBloc>()
          .add(MechanicPartsUsedLoadRequested(serviceJob: widget.jobId));
    }
  }

  void _toggleWorkStatus(int workId, ServiceWorkStatus currentStatus) {
    final next = currentStatus == ServiceWorkStatus.pending
        ? 'in_progress'
        : currentStatus == ServiceWorkStatus.inProgress
            ? 'completed'
            : 'pending';
    context
        .read<MechanicBloc>()
        .add(MechanicWorkStatusUpdateRequested(workId: workId, status: next));
  }

  void _deletePart(int partUsedId) {
    context
        .read<MechanicBloc>()
        .add(MechanicPartUsedDeleteRequested(id: partUsedId));
  }

  void _startWork() {
    setState(() => _isStartingWork = true);
    context
        .read<JobBloc>()
        .add(JobUpdateStatusRequested(jobId: widget.jobId, status: 'in_progress'));
  }

  void _sendForQualityCheck() {
    if (!_allWorkCompleted) return;
    setState(() => _isSubmittingQc = true);
    context
        .read<JobBloc>()
        .add(JobUpdateStatusRequested(jobId: widget.jobId, status: 'qc_pending'));
  }

  Future<void> _openAddWorkSheet() async {
    final added = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider<MechanicBloc>.value(
        value: context.read<MechanicBloc>(),
        child: AddServiceWorkSheet(
          jobId: widget.jobId,
          jobNumber: _job?.jobNumber ?? '',
        ),
      ),
    );
    if (added == true && mounted) {
      _load();
    }
  }

  Future<void> _openAddPartSheet() async {
    final added = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider<MechanicBloc>.value(
        value: context.read<MechanicBloc>(),
        child: AddPartUsedSheet(
          jobId: widget.jobId,
        ),
      ),
    );
    if (added == true && mounted) {
      _load();
    }
  }

  @override
  Widget build(BuildContext context) {
    final job = _job;

    return MultiBlocListener(
      listeners: [
        BlocListener<JobBloc, JobState>(
          listener: _onJobStateChanged,
          listenWhen: (_, current) =>
              current is JobLoaded ||
              current is JobUpdated ||
              current is JobError,
        ),
        BlocListener<MechanicBloc, MechanicState>(
          listener: _onMechanicStateChanged,
          listenWhen: (_, current) =>
              current is MechanicWorksLoaded ||
              current is MechanicPartsUsedLoaded ||
              current is MechanicError ||
              current is MechanicWorkUpdated ||
              current is MechanicPartUsedDeleted,
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: (job == null && _errorMessage != null)
              ? Center(
                  child: Text(_errorMessage!,
                      style: AppTextStyles.bodySecondary),
                )
              : job == null
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.limeAccent),
                    )
                  : RefreshIndicator(
                      onRefresh: () async => _load(),
                      color: AppColors.limeAccent,
                      backgroundColor: AppColors.surface,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // --- Header ---
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      Navigator.of(context).maybePop(),
                                  icon: const Icon(Icons.arrow_back,
                                      color: AppColors.textPrimary),
                                ),
                                Expanded(
                                  child: Text(
                                    job.jobNumber,
                                    style: AppTextStyles.heading3,
                                  ),
                                ),
                                StatusBadge(status: job.status?.toJsonString() ?? ''),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // --- Vehicle info card ---
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.cardBackground,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  _InfoLine(
                                    label: 'VEHICLE NUMBER',
                                    value: job.vehicleNumber ?? '',
                                    valueColor: AppColors.limeAccent,
                                  ),
                                  const SizedBox(height: 10),
                                  _InfoLine(
                                    label: 'MODEL',
                                    value: job.serviceType,
                                  ),
                                  const SizedBox(height: 10),
                                  _InfoLine(
                                    label: 'CUSTOMER',
                                    value: job.customerName ?? '',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),

                            // --- Reported issue banner ---
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: AppColors.amberAccent.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: AppColors.amberAccent
                                        .withValues(alpha: 0.3)),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                          Icons.warning_amber_rounded,
                                          color: AppColors.amberAccent,
                                          size: 16),
                                      const SizedBox(width: 6),
                                      Text('REPORTED ISSUE',
                                          style: AppTextStyles.caption
                                              .copyWith(
                                            color: AppColors.amberAccent,
                                            letterSpacing: 0.5,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '"${job.complaint}"',
                                    style: AppTextStyles.bodyRegular
                                        .copyWith(
                                            fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // --- Service Work ---
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Service Work',
                                    style: AppTextStyles.heading3),
                                TextButton.icon(
                                  onPressed: _openAddWorkSheet,
                                  icon: const Icon(Icons.add,
                                      size: 16,
                                      color: AppColors.limeAccent),
                                  label: const Text('ADD WORK',
                                      style: TextStyle(
                                          color: AppColors.limeAccent)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),

                            if (_workItems.isEmpty)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text('No work items added yet',
                                    style: AppTextStyles.bodySecondary),
                              )
                            else
                              ..._workItems.map((w) {
                                return ServiceWorkItem(
                                  workName: w.workName,
                                  description: w.description ?? '',
                                  labourCharge:
                                      (double.tryParse(w.labourCharge ?? '0') ?? 0)
                                          .toStringAsFixed(0),
                                  status: w.status?.name ?? 'pending',
                                  onStatusTap: () => _toggleWorkStatus(
                                      w.id, w.status ?? ServiceWorkStatus.pending),
                                );
                              }),
                            const SizedBox(height: 16),

                            // --- Parts Used ---
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Parts Used',
                                    style: AppTextStyles.heading3),
                                TextButton.icon(
                                  onPressed: _openAddPartSheet,
                                  icon: const Icon(Icons.add,
                                      size: 16,
                                      color: AppColors.limeAccent),
                                  label: const Text('ADD PART',
                                      style: TextStyle(
                                          color: AppColors.limeAccent)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),

                            if (_partsUsed.isEmpty)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text('No parts used yet',
                                    style: AppTextStyles.bodySecondary),
                              )
                            else
                              ..._partsUsed.map((p) {
                                final price = double.tryParse(p.price ?? '0') ?? 0;
                                final qty = double.tryParse(p.quantity) ?? 0;
                                return PartUsedItem(
                                  partName: p.partName ?? '',
                                  quantity: qty.toStringAsFixed(0),
                                  unit: p.partNumber ?? '',
                                  price: (price * qty).toStringAsFixed(0),
                                  onDelete: () => _deletePart(p.id),
                                );
                              }),
                            const SizedBox(height: 16),

                            // --- Totals ---
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                _TotalBlock(
                                  label: 'TOTAL LABOR',
                                  value: _totalLabour.toStringAsFixed(0),
                                ),
                                Container(
                                    width: 1,
                                    height: 30,
                                    color: AppColors.divider),
                                _TotalBlock(
                                  label: 'TOTAL PARTS',
                                  value: _totalParts.toStringAsFixed(0),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // --- Start work (waiting -> in_progress) ---
                            if (job.status == ServiceJobStatus.waiting) ...[
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: _isStartingWork ? null : _startWork,
                                  icon: _isStartingWork
                                      ? const SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: Colors.black),
                                        )
                                      : const Icon(Icons.play_arrow,
                                          color: Colors.black, size: 18),
                                  label: Text(_isStartingWork
                                      ? 'Starting Work...'
                                      : 'Start Work'),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],

                            // --- Send for QC ---
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed:
                                    _allWorkCompleted && !_isSubmittingQc
                                        ? _sendForQualityCheck
                                        : null,
                                icon: const Icon(Icons.fact_check_outlined,
                                    color: Colors.black, size: 18),
                                label: _isSubmittingQc
                                    ? const SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.black),
                                      )
                                    : const Text('Send for Quality Check'),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Center(
                              child: Text(
                                _allWorkCompleted
                                    ? 'Ready to send for quality check'
                                    : 'Complete all service work to proceed',
                                style: AppTextStyles.caption,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
        ),
        bottomNavigationBar: const RoleBottomNav(role: 'mechanic'),
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine(
      {required this.label, required this.value, this.valueColor});
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppTextStyles.caption.copyWith(letterSpacing: 0.5)),
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

class _TotalBlock extends StatelessWidget {
  const _TotalBlock({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label,
            style: AppTextStyles.caption.copyWith(letterSpacing: 0.5)),
        const SizedBox(height: 4),
        Text('₹$value',
            style: const TextStyle(
                color: AppColors.limeAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
      ],
    );
  }
}
