import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/app_button.dart';
import '../presentation/bloc/mechanic_bloc.dart';
import '../data/models/service_work_model.dart';


class AddServiceWorkSheet extends StatefulWidget {
  const AddServiceWorkSheet({
    super.key,
    required this.jobId,
    required this.jobNumber,
  });

  final int jobId;
  final String jobNumber;

  @override
  State<AddServiceWorkSheet> createState() => _AddServiceWorkSheetState();
}

class _AddServiceWorkSheetState extends State<AddServiceWorkSheet> {
  final TextEditingController _workNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _labourChargeController =
      TextEditingController();

  @override
  void dispose() {
    _workNameController.dispose();
    _descriptionController.dispose();
    _labourChargeController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_workNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a work name'),
          backgroundColor: AppColors.statusError,
        ),
      );
      return;
    }

    context.read<MechanicBloc>().add(
          MechanicWorkCreateRequested(
            request: ServiceWorkCreateRequest(
              workName: _workNameController.text.trim(),
              description: _descriptionController.text.trim(),
              labourCharge:
                  double.tryParse(_labourChargeController.text.trim())
                      ?.toStringAsFixed(2) ??
                      '0.00',
              serviceJob: widget.jobId,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MechanicBloc, MechanicState>(
      listener: (context, state) {
        if (state is MechanicWorkCreated) {
          if (context.mounted) Navigator.of(context).pop(true);
        } else if (state is MechanicError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.statusError,
            ),
          );
        }
      },
      listenWhen: (_, current) =>
          current is MechanicWorkCreated || current is MechanicError,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- Sheet handle ---
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: AppColors.divider,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),

                // --- Mini header ---
                Center(
                  child: Column(
                    children: [
                      Text(
                        'AUTOCARE PRO',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.limeAccent,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text('Job ID: ${widget.jobNumber}',
                          style: AppTextStyles.caption),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Center(
                  child: Text('Add Work Item', style: AppTextStyles.heading2),
                ),
                const SizedBox(height: 6),
                Center(
                  child: Text(
                    'Enter details for the additional service performed.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodySecondary,
                  ),
                ),
                const SizedBox(height: 24),

                const _FieldLabel('Work Name'),
                TextField(
                  controller: _workNameController,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: const InputDecoration(
                    hintText: 'e.g. Oil Filter Replacement',
                    suffixIcon: Icon(Icons.edit_outlined,
                        color: AppColors.textMuted, size: 18),
                  ),
                ),
                const SizedBox(height: 16),

                const _FieldLabel('Description'),
                TextField(
                  controller: _descriptionController,
                  maxLines: 3,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: const InputDecoration(
                    hintText: 'Provide details about the work performed...',
                  ),
                ),
                const SizedBox(height: 16),

                const _FieldLabel('Labour Charge'),
                TextField(
                  controller: _labourChargeController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: const InputDecoration(
                    hintText: '0.00',
                    prefixIcon: Icon(Icons.currency_rupee,
                        color: AppColors.limeAccent, size: 18),
                    suffixIcon: Icon(Icons.calculate_outlined,
                        color: AppColors.textMuted, size: 18),
                  ),
                ),

                const SizedBox(height: 24),
                BlocBuilder<MechanicBloc, MechanicState>(
                  builder: (context, state) {
                    return AppButton(
                      label: 'Add Work',
                      icon: Icons.add_circle_outline,
                      isLoading: state is MechanicLoading,
                      onPressed: _submit,
                    );
                  },
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('CANCEL',
                        style: AppTextStyles.caption.copyWith(
                            letterSpacing: 0.5)),
                  ),
                ),
              ],
            ),
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
