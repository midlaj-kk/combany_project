import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../models/spare_part_model.dart';
import '../services/admin_service.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';
import '../widgets/spare_part_card.dart';

class InventoryListScreen extends StatefulWidget {
  const InventoryListScreen({super.key});

  @override
  State<InventoryListScreen> createState() => _InventoryListScreenState();
}

class _InventoryListScreenState extends State<InventoryListScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _showLowStockOnly = false;

  List<SparePartModel> _allParts = [];
  int _totalParts = 0;
  int _lowStockCount = 0;
  bool _isLoading = true;
  String? _errorMessage;

  List<SparePartModel> get _filteredParts {
    if (!_showLowStockOnly) return _allParts;
    return _allParts.where((p) {
      final stock = double.tryParse(p.stockQuantity ?? '0') ?? 0;
      final minStock = double.tryParse(p.minimumStock ?? '0') ?? 0;
      return stock <= minStock;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _setTab(bool lowStockOnly) {
    setState(() => _showLowStockOnly = lowStockOnly);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminBloc(service: getIt<AdminService>())
        ..add(const AdminSparePartsLoadRequested()),
      child: Builder(
        builder: (blocContext) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: BlocListener<AdminBloc, AdminState>(
                listener: (context, state) {
                  if (state is AdminSparePartsLoaded) {
                    final allParts = state.spareParts.results;
                    final lowCount = allParts.where((p) {
                      final stock =
                          double.tryParse(p.stockQuantity ?? '0') ?? 0;
                      final minStock =
                          double.tryParse(p.minimumStock ?? '0') ?? 0;
                      return stock <= minStock;
                    }).length;
                    setState(() {
                      _allParts = allParts;
                      _totalParts = state.spareParts.count;
                      _lowStockCount = lowCount;
                      _isLoading = false;
                      _errorMessage = null;
                    });
                  } else if (state is AdminStockActionSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                    blocContext.read<AdminBloc>().add(
                          const AdminSparePartsLoadRequested(),
                        );
                  } else if (state is AdminError) {
                    setState(() {
                      _errorMessage = state.message;
                      _isLoading = false;
                    });
                  } else if (state is AdminLoading && _allParts.isEmpty) {
                    setState(() {
                      _isLoading = true;
                      _errorMessage = null;
                    });
                  }
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () =>
                                Navigator.of(context).maybePop(),
                            icon: const Icon(Icons.arrow_back,
                                color: AppColors.textPrimary),
                          ),
                          Expanded(
                            child: Text('Inventory',
                                style: AppTextStyles.heading3),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: _StatBox(
                              label: 'TOTAL PARTS',
                              value: _totalParts.toString(),
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _StatBox(
                              label: 'LOW STOCK',
                              value: _lowStockCount.toString(),
                              color: AppColors.amberAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              style: const TextStyle(
                                  color: AppColors.textPrimary),
                              onSubmitted: (_) {
                                blocContext.read<AdminBloc>().add(
                                      AdminSparePartsLoadRequested(
                                        search: _searchController
                                                .text
                                                .trim()
                                                .isNotEmpty
                                            ? _searchController
                                                .text
                                                .trim()
                                            : null,
                                      ),
                                    );
                              },
                              decoration: const InputDecoration(
                                hintText: 'Search inventory...',
                                prefixIcon: Icon(Icons.search,
                                    color: AppColors.textMuted),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppColors.inputFill,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(Icons.tune,
                                color: AppColors.textMuted),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          _TabChip(
                            label: 'ALL PARTS',
                            isSelected: !_showLowStockOnly,
                            onTap: () => _setTab(false),
                          ),
                          const SizedBox(width: 8),
                          _TabChip(
                            label: 'LOW STOCK',
                            isSelected: _showLowStockOnly,
                            onTap: () => _setTab(true),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          blocContext.read<AdminBloc>().add(
                                AdminSparePartsLoadRequested(
                                  search: _searchController
                                          .text
                                          .trim()
                                          .isNotEmpty
                                      ? _searchController.text.trim()
                                      : null,
                                ),
                              );
                        },
                        color: AppColors.limeAccent,
                        backgroundColor: AppColors.surface,
                        child: _isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.limeAccent),
                              )
                            : _errorMessage != null
                                ? Center(
                                    child: Text(_errorMessage!,
                                        style: AppTextStyles
                                            .bodySecondary),
                                  )
                                : ListView.builder(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 20, 100),
                                    itemCount: _filteredParts.length,
                                    itemBuilder: (context, index) {
                                      final part =
                                          _filteredParts[index];
                                      final stock =
                                          double.tryParse(part.stockQuantity ?? '0') ?? 0;
                                      final minStock =
                                          double.tryParse(part.minimumStock ?? '0') ?? 0;
                                      final isLow =
                                          stock <= minStock;

                                      return SparePartCard(
                                        name: part.name,
                                        partNumber: part.partNumber,
                                        stockQuantity:
                                            stock.toStringAsFixed(2),
                                        unit: part.unit ?? '',
                                        sellingPrice:
                                            (double.tryParse(part.sellingPrice ?? '0') ?? 0)
                                                .toStringAsFixed(2),
                                        isLowStock: isLow,
                                        onAddStock: () => blocContext
                                                .read<AdminBloc>()
                                                .add(
                                                  AdminAddStockRequested(
                                                    partId: part.id,
                                                    quantity: '1',
                                                  ),
                                                ),
                                        onReduceStock: () => blocContext
                                                .read<AdminBloc>()
                                                .add(
                                                  AdminReduceStockRequested(
                                                    partId: part.id,
                                                    quantity: '1',
                                                  ),
                                                ),
                                        onTap: () =>
                                            AppRouter.toStockHistory(
                                          context,
                                          partId: part.id,
                                        ),
                                      );
                                    },
                                  ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  const _StatBox({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  AppTextStyles.caption.copyWith(letterSpacing: 0.6)),
          const SizedBox(height: 4),
          Text(value,
              style:
                  AppTextStyles.heading2.copyWith(color: color)),
        ],
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.limeAccent
              : AppColors.cardBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Colors.black
                : AppColors.textSecondary,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}
