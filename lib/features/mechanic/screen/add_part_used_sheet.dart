import 'dart:async';
import 'package:auto_care_app/core/di/injection.dart';
import 'package:auto_care_app/features/admin/data/datasources/admin_service.dart';
import 'package:auto_care_app/features/admin/data/models/spare_part_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/app_button.dart';
import '../presentation/bloc/mechanic_bloc.dart';
import '../data/models/part_used_model.dart';


class AddPartUsedSheet extends StatefulWidget {
  const AddPartUsedSheet({super.key, required this.jobId});

  final int jobId;

  @override
  State<AddPartUsedSheet> createState() => _AddPartUsedSheetState();
}

class _AddPartUsedSheetState extends State<AddPartUsedSheet> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  bool _isSearching = false;
  List<SparePartModel> _searchResults = [];

  SparePartModel? _selectedPart;
  int _quantity = 1;

  double get _availableStock =>
      double.tryParse(_selectedPart?.stockQuantity ?? '0') ?? 0;

  bool get _exceedsStock =>
      _selectedPart != null && _quantity > _availableStock;

  double get _totalPrice =>
      (double.tryParse(_selectedPart?.sellingPrice ?? '0') ?? 0) *
      _quantity;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _search(String query) {
    _debounce?.cancel();
    _debounce = Timer(
        const Duration(milliseconds: 300), () => _runSearch(query));
  }

  Future<void> _runSearch(String query) async {
    if (query.trim().isEmpty) {
      setState(() => _searchResults = []);
      return;
    }
    setState(() => _isSearching = true);
    try {
      final service = getIt<AdminService>();
      final result = await service.getSpareParts(
        search: query.trim(),
        pageSize: 20,
      );
      if (!mounted) return;
      setState(() => _searchResults = result.results);
    } catch (_) {
      if (!mounted) return;
      setState(() => _searchResults = []);
    } finally {
      if (mounted) {
        setState(() => _isSearching = false);
      }
    }
  }

  void _selectPart(SparePartModel part) {
    setState(() {
      _selectedPart = part;
      _searchResults = [];
      _searchController.text = part.name;
      _quantity = 1;
    });
  }

  void _incrementQuantity() {
    setState(() => _quantity += 1);
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() => _quantity -= 1);
    }
  }

  void _submit() {
    if (_selectedPart == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a part first'),
          backgroundColor: AppColors.statusError,
        ),
      );
      return;
    }
    if (_exceedsStock) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not enough stock available'),
          backgroundColor: AppColors.statusError,
        ),
      );
      return;
    }

    context.read<MechanicBloc>().add(
          MechanicPartUsedAddRequested(
            request: PartUsedCreateRequest(
              serviceJob: widget.jobId,
              part: _selectedPart!.id,
              quantity: _quantity.toString(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MechanicBloc, MechanicState>(
      listener: (context, state) {
        if (state is MechanicPartUsedAdded) {
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
          current is MechanicPartUsedAdded || current is MechanicError,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- Header ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Add Part Used', style: AppTextStyles.heading3),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      icon: const Icon(Icons.close,
                          color: AppColors.textMuted),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // --- Search field ---
                TextField(
                  controller: _searchController,
                  style: const TextStyle(color: AppColors.textPrimary),
                  onChanged: _search,
                  decoration: const InputDecoration(
                    hintText: 'Search spare parts...',
                    prefixIcon:
                        Icon(Icons.search, color: AppColors.textMuted),
                  ),
                ),

                // --- Search results dropdown ---
                if (_isSearching)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: AppColors.limeAccent),
                      ),
                    ),
                  )
                else if (_searchResults.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: AppColors.inputFill,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    constraints: const BoxConstraints(maxHeight: 180),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final part = _searchResults[index];
                        return ListTile(
                          dense: true,
                          title: Text(part.name,
                              style: AppTextStyles.bodyRegular
                                  .copyWith(fontWeight: FontWeight.w600)),
                          subtitle: Text(
                            '${double.tryParse(part.stockQuantity ?? '0')?.toStringAsFixed(2) ?? '0'} ${part.unit ?? ''} available',
                            style: AppTextStyles.caption,
                          ),
                          trailing: Text(
                            '₹${double.tryParse(part.sellingPrice ?? '0')?.toStringAsFixed(2) ?? '0.00'}',
                            style: const TextStyle(
                                color: AppColors.limeAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () => _selectPart(part),
                        );
                      },
                    ),
                  ),

                // --- Selected part card ---
                if (_selectedPart != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.limeAccent),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _selectedPart!.name,
                                style: AppTextStyles.bodyRegular
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${_availableStock.toStringAsFixed(2)} ${_selectedPart!.unit ?? ''} available',
                                style: AppTextStyles.caption,
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.check_circle,
                            color: AppColors.statusSuccess, size: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Text('Quantity',
                      style: AppTextStyles.caption
                          .copyWith(letterSpacing: 0.5)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _QtyButton(
                        icon: Icons.remove,
                        onTap: _decrementQuantity,
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            _quantity.toString(),
                            style: AppTextStyles.heading1.copyWith(fontSize: 28),
                          ),
                        ),
                      ),
                      _QtyButton(
                        icon: Icons.add,
                        onTap: _incrementQuantity,
                      ),
                    ],
                  ),

                  if (_exceedsStock) ...[
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.amberAccent.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.warning_amber_rounded,
                              color: AppColors.amberAccent, size: 16),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Only ${_availableStock.toStringAsFixed(2)} available — reduce quantity',
                              style: AppTextStyles.caption
                                  .copyWith(color: AppColors.amberAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TOTAL PRICE',
                          style: AppTextStyles.caption
                              .copyWith(letterSpacing: 0.5)),
                      Text(
                        '₹${_totalPrice.toStringAsFixed(0)}',
                        style: const TextStyle(
                          color: AppColors.limeAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],

                const SizedBox(height: 20),
                BlocBuilder<MechanicBloc, MechanicState>(
                  builder: (context, state) {
                    return AppButton(
                      label: 'Add Part',
                      isLoading: state is MechanicLoading,
                      onPressed: _selectedPart == null || _exceedsStock
                          ? null
                          : _submit,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  const _QtyButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 44,
        height: 44,
        decoration: const BoxDecoration(
          color: AppColors.inputFill,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.limeAccent),
      ),
    );
  }
}
