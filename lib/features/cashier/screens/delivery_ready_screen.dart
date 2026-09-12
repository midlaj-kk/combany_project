import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_care_app/core/theme/app_colors.dart';
import 'package:auto_care_app/core/theme/app_text_styles.dart';
import 'package:auto_care_app/core/router/app_router.dart';
import 'package:auto_care_app/widgets/common/role_bottom_nav.dart';
import 'package:auto_care_app/features/cashier/bloc/bloc.dart';
import 'package:auto_care_app/features/cashier/bloc/event.dart';
import 'package:auto_care_app/features/cashier/bloc/state.dart';
import '../widgets/delivery_ready_card.dart';

class DeliveryReadyScreen extends StatefulWidget {
  const DeliveryReadyScreen({super.key});

  @override
  State<DeliveryReadyScreen> createState() => _DeliveryReadyScreenState();
}

class _DeliveryReadyScreenState extends State<DeliveryReadyScreen> with RouteAware {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<BillingBloc>().add(const BillingReadyDeliveriesLoadRequested());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      AppRouter.routeObserver.subscribe(this, route);
    }
  }

  @override
  void didPopNext() {
    if (!mounted) return;
    context.read<BillingBloc>().add(const BillingReadyDeliveriesLoadRequested());
    super.didPopNext();
  }

  List<dynamic> _filteredList(List<dynamic> vehicles) {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return vehicles;
    return vehicles.where((v) {
      final vn = (v.vehicleNumber ?? '').toLowerCase();
      final cn = (v.customerName ?? '').toLowerCase();
      return vn.contains(query) || cn.contains(query);
    }).toList();
  }

  @override
  void dispose() {
    AppRouter.routeObserver.unsubscribe(this);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                  ),
                  Expanded(
                    child: Text('Cashier - Delivery Ready List',
                        style: AppTextStyles.heading3.copyWith(color: AppColors.limeAccent)),
                  ),
                  const Icon(Icons.notifications_outlined, color: AppColors.textPrimary, size: 20),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: AppColors.textPrimary),
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  hintText: 'Search by vehicle or name...',
                  prefixIcon: Icon(Icons.search, color: AppColors.textMuted),
                  suffixIcon: Icon(Icons.tune, color: AppColors.textMuted, size: 18),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<BillingBloc>().add(const BillingReadyDeliveriesLoadRequested());
                },
                color: AppColors.limeAccent,
                backgroundColor: AppColors.surface,
                child: BlocBuilder<BillingBloc, BillingState>(
                  builder: (context, state) {
                    if (state is BillingLoading) {
                      return const Center(child: CircularProgressIndicator(color: AppColors.limeAccent));
                    }
                    if (state is BillingError) {
                      return ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: 80),
                          Center(child: Text(state.message, style: AppTextStyles.bodySecondary)),
                        ],
                      );
                    }
                    List<dynamic> vehicles = [];
                    if (state is BillingReadyDeliveriesLoaded) {
                      vehicles = state.deliveries;
                    }
                    final filtered = _filteredList(vehicles);
                    if (filtered.isEmpty) {
                      return ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: 80),
                          Center(child: Text('No vehicles ready for delivery', style: AppTextStyles.bodySecondary)),
                        ],
                      );
                    }
                    return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final job = filtered[index];
                        return DeliveryReadyCard(
                          jobNumber: job.jobNumber ?? '',
                          vehicleModel: '${job.vehicleNumber ?? ''} ${job.serviceType ?? ''}',
                          customerName: job.customerName ?? '',
                          customerPhone: job.customerPhone ?? '',
                          footnote: index == filtered.length - 1
                              ? 'Quality Check Cleared • Final detailing complete'
                              : null,
                          onMarkDelivered: () {
                            AppRouter.toCompleteDelivery(
                              context,
                              jobId: job.id,
                              jobNumber: job.jobNumber ?? '',
                              vehicleLabel: job.vehicleNumber ?? '',
                              customerName: job.customerName ?? '',
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const RoleBottomNav(role: 'cashier', activeIndex: 2),
    );
  }
}
