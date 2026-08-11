import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:flutter/material.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/spare_part_card.dart';

/// Admin "Inventory / Spare Parts" screen.
class InventoryListScreen extends StatefulWidget {
  const InventoryListScreen({super.key});

  @override
  State<InventoryListScreen> createState() => _InventoryListScreenState();
}

class _InventoryListScreenState extends State<InventoryListScreen> {
  final TextEditingController _searchController = TextEditingController();

  bool _isLoading = true;
  String? _errorMessage;
  bool _showLowStockOnly = false;

  List<dynamic> _parts = [];
  int _totalParts = 0;
  int _lowStockCount = 0;

  @override
  void initState() {
    super.initState();
    _loadParts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadParts() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Always fetch the full list to compute the header stats,
      // then apply the tab filter for what's actually displayed.
      final allParts = await DemoRepository.instance
          .getSpareParts(search: _searchController.text.trim());
      final lowCount = allParts
          .where((p) => (p['stock_quantity'] as num) <=
              (p['minimum_stock'] as num))
          .length;

      if (!mounted) return;
      setState(() {
        _totalParts = allParts.length;
        _lowStockCount = lowCount;
        _parts = _showLowStockOnly
            ? allParts
                .where((p) => (p['stock_quantity'] as num) <=
                    (p['minimum_stock'] as num))
                .toList()
            : allParts;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not load inventory. Pull down to retry.';
      });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _setTab(bool lowStockOnly) {
    setState(() => _showLowStockOnly = lowStockOnly);
    _loadParts();
  }

  void _onSearchSubmitted(String _) => _loadParts();

  Future<void> _addStock(int partId) async {
    try {
      await DemoRepository.instance.addStock(partId, 1);
      await _loadParts();
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not update stock. Try again.';
      });
    }
  }

  Future<void> _reduceStock(int partId) async {
    try {
      await DemoRepository.instance
          .reduceStock(partId, 1, reason: 'Manual adjustment');
      await _loadParts();
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not update stock. Try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Text('Inventory', style: AppTextStyles.heading3),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // --- Stat row ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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

            // --- Search + filter ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(color: AppColors.textPrimary),
                      onSubmitted: _onSearchSubmitted,
                      decoration: const InputDecoration(
                        hintText: 'Search inventory...',
                        prefixIcon:
                            Icon(Icons.search, color: AppColors.textMuted),
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
                    child: const Icon(Icons.tune, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // --- Tabs ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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

            // --- Parts list ---
            Expanded(
              child: RefreshIndicator(
                onRefresh: _loadParts,
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
                                style: AppTextStyles.bodySecondary),
                          )
                        : ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                            itemCount: _parts.length,
                            itemBuilder: (context, index) {
                              final part = _parts[index];
                              final stock = part['stock_quantity'];
                              final minStock = part['minimum_stock'];
                              final isLow =
                                  (stock as num) <= (minStock as num);

                              return SparePartCard(
                                name: part['name'] ?? '',
                                partNumber: part['part_number'] ?? '',
                                stockQuantity: stock.toStringAsFixed(2),
                                unit: part['unit'] ?? '',
                                sellingPrice: (part['selling_price'] as num)
                                    .toStringAsFixed(2),
                                isLowStock: isLow,
                                onAddStock: () => _addStock(part['id']),
                                onReduceStock: () =>
                                    _reduceStock(part['id']),
                                onTap: () => AppRouter.toStockHistory(
                                  context,
                                  partId: part['id'],
                                ),
                              );
                            },
                          ),
              ),
            ),
          ],
        ),
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
              style: AppTextStyles.caption.copyWith(letterSpacing: 0.6)),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.heading2.copyWith(color: color)),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.limeAccent : AppColors.cardBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : AppColors.textSecondary,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}
