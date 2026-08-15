import 'dart:async';
import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/app_button.dart';


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
  List<dynamic> _searchResults = [];

  Map<String, dynamic>? _selectedPart;
  int _quantity = 1;

  bool _isSubmitting = false;
  String? _errorMessage;
  bool _addedSuccessfully = false;

  double get _availableStock =>
      (_selectedPart?['stock_quantity'] as num?)?.toDouble() ?? 0;

  bool get _exceedsStock =>
      _selectedPart != null && _quantity > _availableStock;

  double get _totalPrice =>
      ((_selectedPart?['selling_price'] as num?)?.toDouble() ?? 0) *
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
      final results = await DemoRepository.instance
          .searchSpareParts(query.trim());
      if (!mounted) return;
      setState(() => _searchResults = results);
    } catch (_) {
      if (!mounted) return;
      setState(() => _searchResults = []);
    } finally {
      if (mounted) {
        setState(() => _isSearching = false);
      }
    }
  }

  void _selectPart(Map<String, dynamic> part) {
    setState(() {
      _selectedPart = part;
      _searchResults = [];
      _searchController.text = part['name'] ?? '';
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

  Future<void> _submit() async {
    if (_selectedPart == null) {
      setState(() => _errorMessage = 'Please select a part first');
      return;
    }
    if (_exceedsStock) {
      setState(() => _errorMessage = 'Not enough stock available');
      return;
    }

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    try {
      await DemoRepository.instance.addPartUsed(
        jobId: widget.jobId,
        partId: _selectedPart!['id'] as int,
        quantity: _quantity.toDouble(),
      );
      if (!mounted) return;
      setState(() => _addedSuccessfully = true);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not add part. Please try again.';
      });
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_addedSuccessfully) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) Navigator.of(context).pop(true);
      });
    }

    return Padding(
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
                        title: Text(part['name'] ?? '',
                            style: AppTextStyles.bodyRegular
                                .copyWith(fontWeight: FontWeight.w600)),
                        subtitle: Text(
                          '${(part['stock_quantity'] as num?)?.toStringAsFixed(2) ?? '0'} ${part['unit'] ?? ''} available',
                          style: AppTextStyles.caption,
                        ),
                        trailing: Text(
                          '₹${(part['selling_price'] as num?)?.toStringAsFixed(2) ?? '0.00'}',
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
                              _selectedPart!['name'] ?? '',
                              style: AppTextStyles.bodyRegular
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${_availableStock.toStringAsFixed(2)} ${_selectedPart!['unit'] ?? ''} available',
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

              if (_errorMessage != null) ...[
                const SizedBox(height: 12),
                Text(
                  _errorMessage!,
                  style: const TextStyle(
                      color: AppColors.statusError, fontSize: 13),
                ),
              ],

              const SizedBox(height: 20),
              AppButton(
                label: 'Add Part',
                isLoading: _isSubmitting,
                onPressed: _selectedPart == null || _exceedsStock
                    ? null
                    : _submit,
              ),
            ],
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
