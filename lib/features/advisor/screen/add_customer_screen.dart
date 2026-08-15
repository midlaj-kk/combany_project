import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/app_button.dart';
import '../../../widgets/common/app_text_field.dart';
import '../widgets/advisor_tip_banner.dart';
import '../widgets/brand_dropdown.dart';
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

  bool isLoading = false;
  String? errorMessage;
  bool completedSuccessfully = false;

  int? _createdCustomerId;

  void _setBrand(String? brand) {
    setState(() => selectedBrand = brand);
  }

  void _setYear(int newYear) {
    setState(() => year = newYear);
  }

  Future<void> _submitCustomerStep() async {
    if (nameController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
      setState(() {
        errorMessage = 'Please enter at least name and phone number';
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final customer = await DemoRepository.instance.createCustomer(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        email: emailController.text.trim(),
        address: addressController.text.trim(),
      );
      if (!mounted) return;
      setState(() {
        _createdCustomerId = customer['id'] as int;
        currentStep = 2;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Something went wrong. Please try again.';
      });
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  void _skipVehicleStep() {
    setState(() => completedSuccessfully = true);
  }

  Future<void> _submitVehicleStep() async {
    if (_createdCustomerId == null) {
      setState(() {
        errorMessage = 'Customer was not saved correctly. Please start over.';
      });
      return;
    }
    if (vehicleNumberController.text.trim().isEmpty ||
        selectedBrand == null ||
        modelController.text.trim().isEmpty) {
      setState(() {
        errorMessage = 'Please fill in vehicle number, brand, and model';
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await DemoRepository.instance.createVehicle(
        customerId: _createdCustomerId!,
        vehicleNumber: vehicleNumberController.text.trim().toUpperCase(),
        brand: selectedBrand!,
        model: modelController.text.trim(),
        year: year,
        kilometers: int.tryParse(kilometersController.text.trim()),
      );
      if (!mounted) return;
      setState(() => completedSuccessfully = true);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Something went wrong. Please try again.';
      });
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    ? _CustomerStep(state: this)
                    : _VehicleStep(state: this),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomerStep extends StatelessWidget {
  const _CustomerStep({required this.state});
  final _AddCustomerScreenState state;

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

        if (state.errorMessage != null) ...[
          const SizedBox(height: 16),
          Text(
            state.errorMessage!,
            style: const TextStyle(color: AppColors.statusError, fontSize: 13),
          ),
        ],

        const SizedBox(height: 28),
        AppButton(
          label: 'Next: Add Vehicle',
          icon: Icons.arrow_forward,
          isLoading: state.isLoading,
          onPressed: () => state._submitCustomerStep(),
        ),
      ],
    );
  }
}

class _VehicleStep extends StatelessWidget {
  const _VehicleStep({required this.state});
  final _AddCustomerScreenState state;

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

        if (state.errorMessage != null) ...[
          const SizedBox(height: 16),
          Text(
            state.errorMessage!,
            style: const TextStyle(color: AppColors.statusError, fontSize: 13),
          ),
        ],

        const SizedBox(height: 24),
        AppButton(
          label: 'Save & Continue',
          icon: Icons.arrow_forward,
          isLoading: state.isLoading,
          onPressed: () => state._submitVehicleStep(),
        ),
        const SizedBox(height: 12),
        Center(
          child: TextButton(
            onPressed:
                state.isLoading ? null : () => state._skipVehicleStep(),
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
