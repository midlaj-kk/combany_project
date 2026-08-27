import 'package:auto_care_app/features/advisor/models/service_job_model.dart';
import 'package:auto_care_app/features/advisor/bloc/job_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/app_button.dart';
import '../widgets/mechanic_picker.dart';
import 'job_creation_confirmation_screen.dart';


class CreateServiceJobScreen extends StatefulWidget {
  const CreateServiceJobScreen({
    super.key,
    required this.vehicleId,
    required this.vehicleLabel,
    required this.customerName,
  });

  final int vehicleId;
  final String vehicleLabel;
  final String customerName;

  @override
  State<CreateServiceJobScreen> createState() => _CreateServiceJobScreenState();
}

class _CreateServiceJobScreenState extends State<CreateServiceJobScreen> {
  final TextEditingController complaintController = TextEditingController();
  final TextEditingController serviceTypeController = TextEditingController();
  final TextEditingController odometerController = TextEditingController();

  List<Map<String, dynamic>> _mechanics = [];
  int? selectedMechanicId;

  @override
  void initState() {
    super.initState();
    context.read<JobBloc>().add(const JobMechanicsLoadRequested());
  }

  @override
  void dispose() {
    complaintController.dispose();
    serviceTypeController.dispose();
    odometerController.dispose();
    super.dispose();
  }

  void _selectMechanic(int? mechanicId) {
    setState(() => selectedMechanicId = mechanicId);
  }

  void _submit() {
    if (complaintController.text.trim().isEmpty ||
        serviceTypeController.text.trim().isEmpty) {
      return;
    }

    context.read<JobBloc>().add(
      JobCreateRequested(
        request: ServiceJobCreateRequest(
          vehicle: widget.vehicleId,
          complaint: complaintController.text.trim(),
          serviceType: serviceTypeController.text.trim(),
          odometerReading: int.tryParse(odometerController.text.trim()),
          assignedMechanic: selectedMechanicId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<JobBloc, JobState>(
          listener: (context, state) {
            if (state is JobCreated) {
              final warning = state.mechanicWarning;
              if (warning != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(warning)),
                );
              }
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => JobCreationConfirmationScreen(
                    job: state.job.toJson(),
                  ),
                ),
              );
            } else if (state is JobMechanicsLoaded) {
              setState(() => _mechanics = state.mechanics);
            } else if (state is JobError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              // --- Header ---
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      icon: const Icon(Icons.arrow_back,
                          color: AppColors.textPrimary),
                    ),
                    Expanded(
                      child: Text(
                        'Advisor - Create Service Job',
                        style: AppTextStyles.heading3,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Vehicle chip ---
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.limeAccent.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.directions_car,
                                  color: AppColors.limeAccent, size: 20),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.vehicleLabel,
                                    style: AppTextStyles.bodyRegular
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(widget.customerName,
                                      style: AppTextStyles.caption),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).maybePop(),
                              child: const Text('Change',
                                  style:
                                      TextStyle(color: AppColors.limeAccent)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      const _FieldLabel('Complaint / Issue'),
                      TextField(
                        controller: complaintController,
                        maxLines: 3,
                        style: const TextStyle(color: AppColors.textPrimary),
                        decoration: const InputDecoration(
                          hintText:
                              'Describe the problem reported by the customer...',
                        ),
                      ),
                      const SizedBox(height: 16),

                      const _FieldLabel('Service Type'),
                      TextField(
                        controller: serviceTypeController,
                        style: const TextStyle(color: AppColors.textPrimary),
                        decoration: const InputDecoration(
                          hintText: 'e.g. Full Service + Brake Pad Replacement',
                          prefixIcon: Icon(Icons.build_outlined,
                              color: AppColors.textMuted),
                        ),
                      ),
                      const SizedBox(height: 16),

                      const _FieldLabel('Odometer Reading'),
                      TextField(
                        controller: odometerController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: AppColors.textPrimary),
                        decoration: const InputDecoration(
                          hintText: '45,200',
                          prefixIcon: Icon(Icons.speed_outlined,
                              color: AppColors.textMuted),
                          suffixText: 'km',
                          suffixStyle: TextStyle(color: AppColors.textMuted),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const _FieldLabel('Assign Mechanic'),
                          Text('Skip — assign later',
                              style: AppTextStyles.caption),
                        ],
                      ),
                      const SizedBox(height: 8),

                      MechanicPicker(
                        mechanics: _mechanics,
                        selectedMechanicId: selectedMechanicId,
                        onSelected: _selectMechanic,
                      ),
                      if (_mechanics.isEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'No mechanics available yet — the job will be '
                            'created unassigned and an admin can assign it later.',
                            style: AppTextStyles.caption,
                          ),
                        ),

                      const SizedBox(height: 28),
                      BlocBuilder<JobBloc, JobState>(
                        builder: (context, state) {
                          return AppButton(
                            label: 'Create Job',
                            icon: Icons.bolt,
                            isLoading: state is JobLoading,
                            onPressed: _submit,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text.toUpperCase(),
        style: AppTextStyles.caption.copyWith(
          color: AppColors.limeAccent,
          letterSpacing: 0.6,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
