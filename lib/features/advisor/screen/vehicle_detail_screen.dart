import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:auto_care_app/widgets/common/role_bottom_nav.dart';
import 'package:flutter/material.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/service_history_tile.dart';

/// Advisor "Vehicle Detail + Service History" screen.
///
/// Usage once routing is set up:
///   VehicleDetailScreen(vehicleId: vehicle['id'])
class VehicleDetailScreen extends StatefulWidget {
  const VehicleDetailScreen({super.key, required this.vehicleId});

  final int vehicleId;

  @override
  State<VehicleDetailScreen> createState() => _VehicleDetailScreenState();
}

class _VehicleDetailScreenState extends State<VehicleDetailScreen> {
  bool _isLoading = true;
  String? _errorMessage;

  Map<String, dynamic>? _vehicle;
  List<dynamic> _history = [];

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
      final vehicle = await DemoRepository.instance
          .getVehicleDetail(widget.vehicleId);
      final history = await DemoRepository.instance
          .getVehicleHistory(widget.vehicleId);
      if (!mounted) return;
      setState(() {
        _vehicle = vehicle;
        _history = history;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not load vehicle details. Pull down to retry.';
      });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final vehicle = _vehicle;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.limeAccent),
              )
            : _errorMessage != null && vehicle == null
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
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
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
                                child: Text('Advisor - Vehicle Detail',
                                    style: AppTextStyles.heading3),
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

                          // --- Hero car image ---
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 150,
                              width: double.infinity,
                              color: AppColors.inputFill,
                              child: const Icon(Icons.directions_car,
                                  size: 60, color: AppColors.textMuted),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // --- Vehicle info ---
                          Text(
                            (vehicle?['brand'] ?? '').toString().toUpperCase(),
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.limeAccent,
                              letterSpacing: 0.6,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${vehicle?['brand'] ?? ''} ${vehicle?['model'] ?? ''}',
                            style:
                                AppTextStyles.heading1.copyWith(fontSize: 24),
                          ),
                          const SizedBox(height: 14),

                          Row(
                            children: [
                              Expanded(
                                child: _InfoBlock(
                                  label: 'YEAR',
                                  value:
                                      (vehicle?['year'] ?? '').toString(),
                                ),
                              ),
                              Expanded(
                                child: _InfoBlock(
                                  label: 'MILEAGE',
                                  value: '${vehicle?['kilometers'] ?? 0} km',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 14,
                                backgroundColor: AppColors.inputFill,
                                child: Icon(Icons.person,
                                    size: 14, color: AppColors.textMuted),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text('REGISTERED OWNER',
                                      style: AppTextStyles.caption
                                          .copyWith(letterSpacing: 0.4)),
                                  Text(
                                    vehicle?['customer_name'] ?? '',
                                    style: AppTextStyles.bodyRegular
                                        .copyWith(
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // --- Action buttons ---
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () => AppRouter.toCreateServiceJob(
                                context,
                                vehicleId: widget.vehicleId,
                                vehicleLabel:
                                    vehicle?['vehicle_number'] ?? '',
                                customerName:
                                    vehicle?['customer_name'] ?? '',
                              ),
                              icon: const Icon(Icons.add,
                                  color: Colors.black),
                              label: const Text('New Service Job'),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const SizedBox(height: 24),

                          // --- Service History ---
                          Text(
                            'SERVICE HISTORY',
                            style: AppTextStyles.caption
                                .copyWith(letterSpacing: 0.6),
                          ),
                          const SizedBox(height: 4),

                          if (_history.isEmpty)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 24),
                              child: Center(
                                child: Text('No service history yet',
                                    style: AppTextStyles.bodySecondary),
                              ),
                            )
                          else
                            ..._history.map((job) {
                              return ServiceHistoryTile(
                                jobNumber: job['job_number'] ?? '',
                                serviceType: job['service_type'] ?? '',
                                status: job['status'] ?? '',
                                date: job['created_at'] ?? '',
                                mechanicName: job['mechanic_name'] ?? '',
                                amount: job['total_labour'] != null &&
                                        job['total_parts'] != null
                                    ? ((job['total_labour'] as num) +
                                            (job['total_parts'] as num))
                                        .toStringAsFixed(0)
                                    : null,
                                onTap: () => AppRouter.toJobDetailAdvisor(
                                  context,
                                  jobId: job['id'],
                                ),
                              );
                            }),

                          const SizedBox(height: 20),

                          // --- Additional vehicle specs ---
                          Row(
                            children: [
                              Expanded(
                                child: _SpecCard(
                                  label: 'FUEL TYPE',
                                  value: vehicle?['fuel_type'] ?? 'Petrol',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _SpecCard(
                                  label: 'TRANSMISSION',
                                  value: vehicle?['transmission'] ??
                                      'Automatic',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _SpecCard(
                                  label: 'ENGINE',
                                  value: vehicle?['engine_cc'] != null
                                      ? '${vehicle?['engine_cc']} cc'
                                      : 'N/A',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _SpecCard(
                                  label: 'LAST CHECKUP',
                                  value:
                                      vehicle?['last_checkup'] ?? 'N/A',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
      bottomNavigationBar: _isLoading
          ? null
          : const RoleBottomNav(role: 'advisor', activeIndex: 1),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  const _InfoBlock({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppTextStyles.caption.copyWith(letterSpacing: 0.5)),
        const SizedBox(height: 2),
        Text(value,
            style: AppTextStyles.bodyRegular
                .copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _SpecCard extends StatelessWidget {
  const _SpecCard({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: AppTextStyles.caption.copyWith(letterSpacing: 0.5)),
          const SizedBox(height: 4),
          Text(value,
              style: AppTextStyles.bodyRegular
                  .copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
