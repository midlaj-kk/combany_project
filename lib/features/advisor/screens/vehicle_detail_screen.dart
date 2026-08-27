import 'package:auto_care_app/features/advisor/models/service_job_model.dart';
import 'package:auto_care_app/features/advisor/models/vehicle_model.dart';
import 'package:auto_care_app/features/advisor/bloc/vehicle_bloc.dart';
import 'package:auto_care_app/widgets/common/role_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/service_history_tile.dart';


class VehicleDetailScreen extends StatefulWidget {
  const VehicleDetailScreen({super.key, required this.vehicleId});

  final int vehicleId;

  @override
  State<VehicleDetailScreen> createState() => _VehicleDetailScreenState();
}

class _VehicleDetailScreenState extends State<VehicleDetailScreen> {
  String _statusString(ServiceJobStatus? status) => switch (status) {
    ServiceJobStatus.waiting => 'waiting',
    ServiceJobStatus.inProgress => 'in_progress',
    ServiceJobStatus.waitingForParts => 'waiting_for_parts',
    ServiceJobStatus.qcPending => 'qc_pending',
    ServiceJobStatus.reworkRequired => 'rework_required',
    ServiceJobStatus.readyForBill => 'ready_for_bill',
    ServiceJobStatus.readyForDelivery => 'ready_for_delivery',
    ServiceJobStatus.delivered => 'delivered',
    ServiceJobStatus.cancelled => 'cancelled',
    null => '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<VehicleBloc, VehicleState>(
          builder: (context, state) {
            final isLoading = state is VehicleLoading;
            final errorMessage =
                state is VehicleError ? state.message : null;

            VehicleModel? vehicle;
            List<ServiceJobModel> history = [];

            if (state is VehicleLoaded) {
              vehicle = state.vehicle;
            }
            if (state is VehicleHistoryLoaded) {
              history = state.jobs;
            }

            if (isLoading && vehicle == null) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.limeAccent),
              );
            }

            if (errorMessage != null && vehicle == null) {
              return Center(
                child: Text(errorMessage,
                    style: AppTextStyles.bodySecondary),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                if (!mounted) return;
                context.read<VehicleBloc>()
                  ..add(VehicleLoadRequested(id: widget.vehicleId))
                  ..add(VehicleHistoryLoadRequested(vehicleId: widget.vehicleId));
              },
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
                      vehicle?.brand.toUpperCase() ?? '',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.limeAccent,
                        letterSpacing: 0.6,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${vehicle?.brand ?? ''} ${vehicle?.model ?? ''}',
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
                                (vehicle?.year ?? '').toString(),
                          ),
                        ),
                        Expanded(
                          child: _InfoBlock(
                            label: 'MILEAGE',
                            value: '${vehicle?.kilometers ?? 0} km',
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
                              '',
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
                              vehicle?.vehicleNumber ?? '',
                          customerName: '',
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

                    if (history.isEmpty)
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 24),
                        child: Center(
                          child: Text('No service history yet',
                              style: AppTextStyles.bodySecondary),
                        ),
                      )
                    else
                      ...history.map((job) {
                        return ServiceHistoryTile(
                          jobNumber: job.jobNumber,
                          serviceType: job.serviceType,
                          status: _statusString(job.status),
                          date: job.createdAt ?? '',
                          mechanicName: job.mechanicName ?? '',
                          amount: null,
                          onTap: () => AppRouter.toJobDetailAdvisor(
                            context,
                            jobId: job.id,
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
                            value: 'Petrol',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _SpecCard(
                            label: 'TRANSMISSION',
                            value: 'Automatic',
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
                            value: 'N/A',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _SpecCard(
                            label: 'LAST CHECKUP',
                            value: 'N/A',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const RoleBottomNav(role: 'advisor', activeIndex: 1),
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
