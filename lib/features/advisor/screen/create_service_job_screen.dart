import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:flutter/material.dart';
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

  bool isLoadingMechanics = true;
  List<dynamic> mechanics = [];
  int? selectedMechanicId;

  bool isSubmitting = false;
  String? errorMessage;
  bool createdSuccessfully = false;
  Map<String, dynamic>? createdJob;

  @override
  void initState() {
    super.initState();
    _loadMechanics();
  }

  @override
  void dispose() {
    complaintController.dispose();
    serviceTypeController.dispose();
    odometerController.dispose();
    super.dispose();
  }

  Future<void> _loadMechanics() async {
    setState(() => isLoadingMechanics = true);
    try {
      final mechanics = await DemoRepository.instance.getMechanics();
      if (!mounted) return;
      setState(() => this.mechanics = mechanics);
    } catch (_) {
      // Non-fatal — mechanic assignment can happen later.
      if (!mounted) return;
      setState(() => mechanics = []);
    } finally {
      if (mounted) {
        setState(() => isLoadingMechanics = false);
      }
    }
  }

  void _selectMechanic(int? mechanicId) {
    setState(() => selectedMechanicId = mechanicId);
  }

  Future<void> _submit() async {
    if (complaintController.text.trim().isEmpty ||
        serviceTypeController.text.trim().isEmpty) {
      setState(() {
        errorMessage = 'Please describe the complaint and service type';
      });
      return;
    }

    setState(() {
      isSubmitting = true;
      errorMessage = null;
    });

    try {
      final job = await DemoRepository.instance.createServiceJob(
        vehicleId: widget.vehicleId,
        complaint: complaintController.text.trim(),
        serviceType: serviceTypeController.text.trim(),
        odometerReading: int.tryParse(odometerController.text.trim()),
        assignedMechanicId: selectedMechanicId,
      );
      if (!mounted) return;
      setState(() {
        createdJob = job;
        createdSuccessfully = true;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Something went wrong. Please try again.';
      });
    } finally {
      if (mounted) {
        setState(() => isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (createdSuccessfully && createdJob != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) =>
                JobCreationConfirmationScreen(job: createdJob!),
          ),
        );
      });
    }

    return Scaffold(
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

                    isLoadingMechanics
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.limeAccent),
                            ),
                          )
                        : MechanicPicker(
                            mechanics: mechanics,
                            selectedMechanicId: selectedMechanicId,
                            onSelected: _selectMechanic,
                          ),

                    if (errorMessage != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        errorMessage!,
                        style: const TextStyle(
                            color: AppColors.statusError, fontSize: 13),
                      ),
                    ],

                    const SizedBox(height: 28),
                    AppButton(
                      label: 'Create Job',
                      icon: Icons.bolt,
                      isLoading: isSubmitting,
                      onPressed: _submit,
                    ),
                  ],
                ),
              ),
            ),
          ],
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
