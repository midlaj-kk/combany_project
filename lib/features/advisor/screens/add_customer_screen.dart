import 'package:auto_care_app/features/advisor/models/customer_model.dart';
import 'package:auto_care_app/features/advisor/models/vehicle_model.dart';
import 'package:auto_care_app/features/advisor/models/service_job_model.dart';
import 'package:auto_care_app/features/advisor/bloc/customer_bloc.dart';
import 'package:auto_care_app/features/advisor/bloc/vehicle_bloc.dart';
import 'package:auto_care_app/features/advisor/bloc/job_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/app_button.dart';
import '../../../widgets/common/app_text_field.dart';
import '../widgets/advisor_tip_banner.dart';
import '../widgets/brand_dropdown.dart';
import '../widgets/mechanic_picker.dart';
import '../widgets/number_stepper.dart';
import '../widgets/step_progress_indicator.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  int currentStep = 1; 

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final TextEditingController vehicleNumberController = TextEditingController();
  String? selectedBrand;
  final TextEditingController modelController = TextEditingController();
  int year = DateTime.now().year;
  final TextEditingController kilometersController = TextEditingController();

  bool completedSuccessfully = false;

  int? _createdCustomerId;
  int? _createdVehicleId;

  final TextEditingController complaintController = TextEditingController();
  final TextEditingController serviceTypeController = TextEditingController();
  final TextEditingController odometerController = TextEditingController();
  int? selectedMechanicId;
  List<Map<String, dynamic>> mechanics = [];

  void _setBrand(String? brand) {
    setState(() => selectedBrand = brand);
  }

  void _setYear(int newYear) {
    setState(() => year = newYear);
  }

  void _selectMechanic(int? mechanicId) {
    setState(() => selectedMechanicId = mechanicId);
  }

  void _submitServiceStep() {
    if (_createdVehicleId == null) {
      return;
    }
    if (complaintController.text.trim().isEmpty ||
        serviceTypeController.text.trim().isEmpty) {
      return;
    }

    context.read<JobBloc>().add(
      JobCreateRequested(
        request: ServiceJobCreateRequest(
          vehicle: _createdVehicleId!,
          complaint: complaintController.text.trim(),
          serviceType: serviceTypeController.text.trim(),
          odometerReading: int.tryParse(odometerController.text.trim()),
          assignedMechanic: selectedMechanicId,
        ),
      ),
    );
  }

  void _skipServiceStep() {
    setState(() => completedSuccessfully = true);
  }

  void _submitCustomerStep() {
    if (nameController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
      return;
    }

    context.read<CustomerBloc>().add(
      CustomerCreateRequested(
        request: CustomerCreateRequest(
          name: nameController.text.trim(),
          phone: phoneController.text.trim(),
          email: emailController.text.trim().isEmpty
              ? null
              : emailController.text.trim(),
          address: addressController.text.trim().isEmpty
              ? null
              : addressController.text.trim(),
        ),
      ),
    );
  }

  void _skipVehicleStep() {
    setState(() => completedSuccessfully = true);
  }

  void _submitVehicleStep() {
    if (_createdCustomerId == null) {
      return;
    }
    if (vehicleNumberController.text.trim().isEmpty ||
        selectedBrand == null ||
        modelController.text.trim().isEmpty) {
      return;
    }

    context.read<VehicleBloc>().add(
      VehicleCreateRequested(
        request: VehicleCreateRequest(
          customer: _createdCustomerId!,
          vehicleNumber: vehicleNumberController.text.trim().toUpperCase(),
          brand: selectedBrand!,
          model: modelController.text.trim(),
          year: year,
          kilometers: int.tryParse(kilometersController.text.trim()) ?? 0,
        ),
      ),
    );
  }

  void _goBackToStep1() {
    setState(() => currentStep = 1);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    vehicleNumberController.dispose();
    modelController.dispose();
    kilometersController.dispose();
    complaintController.dispose();
    serviceTypeController.dispose();
    odometerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CustomerBloc, CustomerState>(
          listener: (context, state) {
            if (state is CustomerCreated) {
              setState(() {
                _createdCustomerId = state.customer.id;
                currentStep = 2;
              });
            }
          },
        ),
        BlocListener<VehicleBloc, VehicleState>(
          listener: (context, state) {
            if (state is VehicleCreated) {
              setState(() {
                _createdVehicleId = state.vehicle.id;
                currentStep = 3;
              });
              context.read<JobBloc>().add(const JobMechanicsLoadRequested());
            }
          },
        ),
        BlocListener<JobBloc, JobState>(
          listener: (context, state) {
            if (state is JobCreated) {
              setState(() => completedSuccessfully = true);
              final warning = state.mechanicWarning;
              if (warning != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(warning)),
                );
              }
            } else if (state is JobMechanicsLoaded) {
              setState(() => mechanics = state.mechanics);
            } else if (state is JobError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
        ),
      ],
      child: BlocConsumer<CustomerBloc, CustomerState>(
        listenWhen: (prev, curr) => curr is CustomerError,
        listener: (context, state) {
          if (state is CustomerError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, customerState) {
          return BlocConsumer<VehicleBloc, VehicleState>(
            listenWhen: (prev, curr) => curr is VehicleError,
            listener: (context, state) {
              if (state is VehicleError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, vehicleState) {
              final jobState = context.watch<JobBloc>().state;
              final isLoading = customerState is CustomerLoading ||
                  vehicleState is VehicleLoading ||
                  jobState is JobLoading;

              if (completedSuccessfully) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Customer saved successfully')),
                  );
                  Navigator.of(context).maybePop();
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
                              onPressed: () {
                                if (currentStep == 2) {
                                  _goBackToStep1();
                                } else if (currentStep == 3) {
                                  setState(() => currentStep = 2);
                                } else {
                                  Navigator.of(context).maybePop();
                                }
                              },
                              icon: const Icon(Icons.arrow_back,
                                  color: AppColors.textPrimary),
                            ),
                            Expanded(
                              child: Text(
                                'Advisor - Add Customer + Vehicle',
                                style: AppTextStyles.heading3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),

                      // --- Step progress ---
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: StepProgressIndicator(currentStep: currentStep),
                      ),
                      const SizedBox(height: 20),

                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                          child: currentStep == 1
                              ? _CustomerStep(
                                  state: this,
                                  isLoading: isLoading,
                                )
                              : currentStep == 2
                                  ? _VehicleStep(
                                      state: this,
                                      isLoading: isLoading,
                                    )
                                  : _ServiceStep(
                                      state: this,
                                      isLoading: isLoading,
                                      mechanics: mechanics,
                                    ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _CustomerStep extends StatelessWidget {
  const _CustomerStep({required this.state, required this.isLoading});
  final _AddCustomerScreenState state;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Customer Profile', style: AppTextStyles.heading2),
        const SizedBox(height: 6),
        Text(
          'Enter the primary contact information to begin the service record.',
          style: AppTextStyles.bodySecondary,
        ),
        const SizedBox(height: 24),

        const _FieldLabel('Full Name'),
        AppTextField(
          controller: state.nameController,
          hint: 'e.g. Julian Anderson',
          icon: Icons.person_outline,
        ),
        const SizedBox(height: 16),

        const _FieldLabel('Phone Number'),
        AppTextField(
          controller: state.phoneController,
          hint: '+1 (555) 000-0000',
          icon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 16),

        const _FieldLabel('Email (Optional)'),
        AppTextField(
          controller: state.emailController,
          hint: 'j.anderson@email.com',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),

        const _FieldLabel('Residential Address'),
        AppTextField(
          controller: state.addressController,
          hint: 'Street name, City, Zip Code...',
          icon: Icons.location_on_outlined,
        ),
        const SizedBox(height: 20),

        const AdvisorTipBanner(
          title: 'ADVISOR TIP',
          message:
              'Ensure the phone number is verified for SMS status updates. '
              'Luxury clients prefer digital communication for service '
              'progress milestones.',
        ),

        const SizedBox(height: 28),
        AppButton(
          label: 'Next: Add Vehicle',
          icon: Icons.arrow_forward,
          isLoading: isLoading,
          onPressed: () => state._submitCustomerStep(),
        ),
      ],
    );
  }
}

class _VehicleStep extends StatelessWidget {
  const _VehicleStep({required this.state, required this.isLoading});
  final _AddCustomerScreenState state;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Add Vehicle', style: AppTextStyles.heading2),
        const SizedBox(height: 20),

        const _FieldLabel('Vehicle Number'),
        AppTextField(
          controller: state.vehicleNumberController,
          hint: 'KA-01-AB-1234',
          icon: Icons.confirmation_number_outlined,
        ),
        const SizedBox(height: 16),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _FieldLabel('Brand'),
                  BrandDropdown(
                    value: state.selectedBrand,
                    onChanged: (brand) => state._setBrand(brand),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _FieldLabel('Model'),
                  AppTextField(
                    controller: state.modelController,
                    hint: 'e.g. 911 GT3',
                    icon: Icons.directions_car_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _FieldLabel('Year'),
                  NumberStepper(
                    value: state.year,
                    onChanged: (y) => state._setYear(y),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _FieldLabel('Current Kilometers'),
                  AppTextField(
                    controller: state.kilometersController,
                    hint: '12,500',
                    icon: Icons.speed_outlined,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // --- Vehicle scanning banner ---
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            children: [
              Container(
                height: 130,
                width: double.infinity,
                color: AppColors.inputFill,
                child: const Icon(Icons.album_outlined,
                    size: 64, color: AppColors.textMuted),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppColors.background.withValues(alpha: 0.85),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 14,
                bottom: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'VEHICLE SCANNING READY',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.limeAccent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('Precision diagnostic suite active',
                        style: AppTextStyles.caption),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),
        AppButton(
          label: 'Save & Continue',
          icon: Icons.arrow_forward,
          isLoading: isLoading,
          onPressed: () => state._submitVehicleStep(),
        ),
        const SizedBox(height: 12),
        Center(
          child: TextButton(
            onPressed:
                isLoading ? null : () => state._skipVehicleStep(),
            child: Text('Skip for now', style: AppTextStyles.bodySecondary),
          ),
        ),
      ],
    );
  }
}

class _ServiceStep extends StatelessWidget {
  const _ServiceStep({
    required this.state,
    required this.isLoading,
    required this.mechanics,
  });
  final _AddCustomerScreenState state;
  final bool isLoading;
  final List<Map<String, dynamic>> mechanics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Create Service Job', style: AppTextStyles.heading2),
        const SizedBox(height: 6),
        Text(
          'Describe the service required for this vehicle.',
          style: AppTextStyles.bodySecondary,
        ),
        const SizedBox(height: 24),

        const _FieldLabel('Complaint / Issue'),
        TextField(
          controller: state.complaintController,
          maxLines: 3,
          style: const TextStyle(color: AppColors.textPrimary),
          decoration: const InputDecoration(
            hintText: 'Describe the problem reported by the customer...',
            prefixIcon: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Icon(Icons.report_problem_outlined,
                  color: AppColors.textMuted, size: 20),
            ),
          ),
        ),
        const SizedBox(height: 16),

        const _FieldLabel('Service Type'),
        AppTextField(
          controller: state.serviceTypeController,
          hint: 'e.g. Full Service + Brake Pad Replacement',
          icon: Icons.build_outlined,
        ),
        const SizedBox(height: 16),

        const _FieldLabel('Odometer Reading'),
        AppTextField(
          controller: state.odometerController,
          hint: '45,200',
          icon: Icons.speed_outlined,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _FieldLabel('Assign Mechanic'),
            Text('Skip — assign later', style: AppTextStyles.caption),
          ],
        ),
        const SizedBox(height: 8),

        MechanicPicker(
          mechanics: mechanics,
          selectedMechanicId: state.selectedMechanicId,
          onSelected: (id) => state._selectMechanic(id),
        ),
        if (mechanics.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'No mechanics available yet — the job will be '
              'created unassigned and an admin can assign it later.',
              style: AppTextStyles.caption,
            ),
          ),

        const SizedBox(height: 28),
        AppButton(
          label: 'Create Service Job',
          icon: Icons.bolt,
          isLoading: isLoading,
          onPressed: () => state._submitServiceStep(),
        ),
        const SizedBox(height: 12),
        Center(
          child: TextButton(
            onPressed: isLoading ? null : () => state._skipServiceStep(),
            child: Text('Skip for now', style: AppTextStyles.bodySecondary),
          ),
        ),
      ],
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
