import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../data/models/spare_part_model.dart';
import '../domain/repositories/admin_repository.dart';
import '../presentation/bloc/admin_bloc.dart';
import '../widgets/movement_history_item.dart';

class StockHistoryScreen extends StatefulWidget {
  const StockHistoryScreen({super.key, required this.partId});

  final int partId;

  @override
  State<StockHistoryScreen> createState() => _StockHistoryScreenState();
}

class _StockHistoryScreenState extends State<StockHistoryScreen> {
  SparePartModel? _partDetail;
  List<dynamic> _movements = [];
  bool _historyLoaded = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminBloc(repository: getIt<AdminRepository>())
        ..add(AdminSparePartLoadRequested(id: widget.partId)),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: BlocListener<AdminBloc, AdminState>(
                listener: (context, state) {
                  if (state is AdminSparePartLoaded) {
                    setState(() => _partDetail = state.sparePart);
                    context.read<AdminBloc>().add(
                          AdminStockHistoryRequested(
                              partId: widget.partId),
                        );
                  } else if (state is AdminStockHistoryLoaded) {
                    setState(() {
                      _movements = state.history;
                      _historyLoaded = true;
                    });
                  }
                },
                child: BlocBuilder<AdminBloc, AdminState>(
                  builder: (context, state) {
                    if (state is AdminLoading && !_historyLoaded) {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.limeAccent),
                      );
                    }
                    if (state is AdminError && _partDetail == null) {
                      return Center(
                        child: Text(state.message,
                            style: AppTextStyles.bodySecondary),
                      );
                    }
                    return _buildContent(context);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final part = _partDetail;
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _partDetail = null;
          _movements = [];
          _historyLoaded = false;
        });
        if (context.mounted) {
          context.read<AdminBloc>().add(
                AdminSparePartLoadRequested(id: widget.partId),
              );
        }
      },
      color: AppColors.limeAccent,
      backgroundColor: AppColors.surface,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  icon: const Icon(Icons.arrow_back,
                      color: AppColors.textPrimary),
                ),
                Expanded(
                  child: Text(
                    'Admin - Stock History',
                    style: AppTextStyles.heading3,
                  ),
                ),
                const Icon(Icons.notifications_outlined,
                    color: AppColors.textPrimary),
                const SizedBox(width: 10),
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.inputFill,
                  child: Icon(Icons.person,
                      size: 16, color: AppColors.textMuted),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        (double.tryParse(
                                    part?.stockQuantity ?? '0') ??
                                0)
                            .toStringAsFixed(2),
                        style: AppTextStyles.heading1
                            .copyWith(fontSize: 40),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        (part?.unit ?? '').toUpperCase(),
                        style: AppTextStyles.bodySecondary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'TOTAL AVAILABLE STOCK',
                    style: AppTextStyles.caption
                        .copyWith(letterSpacing: 0.6),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _PricePill(
                        icon: Icons.shopping_cart_outlined,
                        label: 'Purchase:',
                        value:
                            '\u20B9${(double.tryParse(part?.purchasePrice ?? '0') ?? 0).toStringAsFixed(2)}',
                      ),
                      const SizedBox(width: 10),
                      _PricePill(
                        icon: Icons.sell_outlined,
                        label: 'Selling:',
                        value:
                            '\u20B9${(double.tryParse(part?.sellingPrice ?? '0') ?? 0).toStringAsFixed(2)}',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('Movement History',
                style: AppTextStyles.heading3),
            const SizedBox(height: 8),
            if (_movements.isEmpty)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24),
                child: Text('No stock movements yet',
                    style: AppTextStyles.bodySecondary),
              )
            else
              ..._movements.map((m) {
                final isIn = m['movement_type'] == 'in';
                final qty =
                    (m['quantity'] as num).toStringAsFixed(2);
                final refType =
                    (m['reference_type'] ?? '').toString();
                final title = refType == 'purchase'
                    ? 'Purchase Order'
                    : refType == 'service_job'
                        ? 'Used in Job ${m['reference_id'] ?? ''}'
                        : 'Manual Adjustment';
                return MovementHistoryItem(
                  title: title,
                  subtitle:
                      '${m['created_by_name'] ?? 'Unknown'} \u2022 ${m['created_at'] ?? ''}',
                  quantityChange:
                      '${isIn ? '+' : '-'}$qty',
                  movementType: isIn ? 'in' : 'out',
                );
              }),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'INVENTORY HEALTH',
                    style: AppTextStyles.caption.copyWith(
                        color: AppColors.limeAccent,
                        letterSpacing: 0.6),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.75,
                      minHeight: 6,
                      backgroundColor: AppColors.inputFill,
                      color: AppColors.limeAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Stock level is optimal. Next reorder estimated in 12 days.',
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _InfoCard(
                    icon: Icons.home_work_outlined,
                    label: 'LOCATION',
                    value: 'Rack A-12',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _InfoCard(
                    icon: Icons.verified_outlined,
                    label: 'SUPPLIER',
                    value: 'N/A',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PricePill extends StatelessWidget {
  const _PricePill({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.limeAccent),
          const SizedBox(width: 6),
          Text(label, style: AppTextStyles.caption),
          const SizedBox(width: 4),
          Text(value,
              style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

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
          Icon(icon, color: AppColors.limeAccent, size: 18),
          const SizedBox(height: 8),
          Text(label,
              style:
                  AppTextStyles.caption.copyWith(letterSpacing: 0.5)),
          const SizedBox(height: 2),
          Text(value,
              style: AppTextStyles.bodyRegular
                  .copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
