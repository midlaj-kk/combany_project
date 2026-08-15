import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/role_bottom_nav.dart';
import '../../../widgets/common/status_badge.dart';
import '../widgets/part_used_item.dart';
import '../widgets/service_work_item.dart';
import 'add_part_used_sheet.dart';
import 'add_service_work_sheet.dart';


class JobDetailMechanicScreen extends StatefulWidget {
  const JobDetailMechanicScreen({super.key, required this.jobId});

  final int jobId;

  @override
  State<JobDetailMechanicScreen> createState() =>
      _JobDetailMechanicScreenState();
}

class _JobDetailMechanicScreenState extends State<JobDetailMechanicScreen> {
  bool _isLoading = true;
  String? _errorMessage;

  Map<String, dynamic>? _job;
  List<dynamic> _workItems = [];
  List<dynamic> _partsUsed = [];

  bool _isSubmittingQc = false;

  double get _totalLabour => _workItems.fold(
      0, (sum, w) => sum + ((w['labour_charge'] as num?)?.toDouble() ?? 0));

  double get _totalParts => _partsUsed.fold(
      0,
      (sum, p) =>
          sum +
          (((p['price'] as num?)?.toDouble() ?? 0) *
              ((p['quantity'] as num?)?.toDouble() ?? 0)));

  bool get _allWorkCompleted =>
      _workItems.isNotEmpty &&
      _workItems.every((w) => w['status'] == 'completed');

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final job =
          await DemoRepository.instance.getJobDetail(widget.jobId);
      final workItems =
          await DemoRepository.instance.getServiceWork(widget.jobId);
      final partsUsed =
          await DemoRepository.instance.getPartsUsed(widget.jobId);
      if (!mounted) return;
      setState(() {
        _job = job;
        _workItems = workItems;
        _partsUsed = partsUsed;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not load job details. Pull down to retry.';
      });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _toggleWorkStatus(int workId, String currentStatus) async {
    final next = currentStatus == 'pending'
        ? 'in_progress'
        : currentStatus == 'in_progress'
            ? 'completed'
            : 'pending';
    try {
      await DemoRepository.instance.updateWorkStatus(workId, next);
      await _load();
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not update work status.';
      });
    }
  }

  Future<void> _deletePart(int partUsedId) async {
    try {
      await DemoRepository.instance.deletePartUsed(partUsedId);
      await _load();
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not remove part.';
      });
    }
  }

  Future<void> _sendForQualityCheck() async {
    if (!_allWorkCompleted) return;
    setState(() => _isSubmittingQc = true);
    try {
      await DemoRepository.instance.updateJobStatus(widget.jobId, 'qc_pending');
      await _load();
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not send for quality check.';
      });
    } finally {
      if (mounted) {
        setState(() => _isSubmittingQc = false);
      }
    }
  }

  Future<void> _openAddWorkSheet() async {
    final added = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddServiceWorkSheet(
        jobId: widget.jobId,
        jobNumber: _job?['job_number'] ?? '',
      ),
    );
    if (added == true && mounted) {
      await _load();
    }
  }

  Future<void> _openAddPartSheet() async {
    final added = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddPartUsedSheet(
        jobId: widget.jobId,
      ),
    );
    if (added == true && mounted) {
      await _load();
    }
  }

  @override
  Widget build(BuildContext context) {
    final job = _job;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.limeAccent),
              )
            : _errorMessage != null && job == null
                ? Center(
                    child: Text(_errorMessage!,
                        style: AppTextStyles.bodySecondary),
                  )
                : RefreshIndicator(
                    onRefresh: _load,
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
                                  job?['job_number'] ?? '',
                                  style: AppTextStyles.heading3,
                                ),
                              ),
                              StatusBadge(status: job?['status'] ?? ''),
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
                                  value: job?['vehicle_number'] ?? '',
                                  valueColor: AppColors.limeAccent,
                                ),
                                const SizedBox(height: 10),
                                _InfoLine(
                                  label: 'MODEL',
                                  value: job?['vehicle_model'] ??
                                      job?['service_type'] ??
                                      '',
                                ),
                                const SizedBox(height: 10),
                                _InfoLine(
                                  label: 'CUSTOMER',
                                  value: job?['customer_name'] ?? '',
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
                                  '"${job?['complaint'] ?? ''}"',
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
                                workName: w['work_name'] ?? '',
                                description: w['description'] ?? '',
                                labourCharge: (w['labour_charge'] as num?)
                                        ?.toStringAsFixed(0) ??
                                    '0',
                                status: w['status'] ?? 'pending',
                                onStatusTap: () => _toggleWorkStatus(
                                    w['id'], w['status']),
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
                              return PartUsedItem(
                                partName: p['part_name'] ?? '',
                                quantity: (p['quantity'] as num?)
                                        ?.toStringAsFixed(0) ??
                                    '0',
                                unit: p['part_number'] ?? '',
                                price: ((p['price'] as num?) != null &&
                                        (p['quantity'] as num?) != null)
                                    ? ((p['price'] as num) *
                                            (p['quantity'] as num))
                                        .toStringAsFixed(0)
                                    : '0',
                                onDelete: () => _deletePart(p['id']),
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
