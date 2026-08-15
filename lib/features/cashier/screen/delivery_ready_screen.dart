import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/common/role_bottom_nav.dart';
import '../widgets/delivery_ready_card.dart';
import 'complete_delivery_screen.dart';

class DeliveryReadyScreen extends StatefulWidget {
  const DeliveryReadyScreen({super.key});

  @override
  State<DeliveryReadyScreen> createState() => _DeliveryReadyScreenState();
}

class _DeliveryReadyScreenState extends State<DeliveryReadyScreen> {
  final TextEditingController _searchController = TextEditingController();

  bool _isLoading = true;
  String? _errorMessage;
  List<dynamic> _vehicles = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final vehicles = await DemoRepository.instance.getDeliveryReady();
      if (!mounted) return;
      setState(() => _vehicles = vehicles);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not load delivery list. Pull down to retry.';
      });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  List<dynamic> get _filteredVehicles {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return _vehicles;
    return _vehicles.where((v) {
      final vehicleNumber =
          (v['vehicle_number'] ?? '').toString().toLowerCase();
      final customerName = (v['customer_name'] ?? '').toString().toLowerCase();
      return vehicleNumber.contains(query) || customerName.contains(query);
    }).toList();
  }

  @override
  void dispose() {
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
                      'Cashier - Delivery Ready List',
                      style: AppTextStyles.heading3
                          .copyWith(color: AppColors.limeAccent),
                    ),
                  ),
                  const Icon(Icons.notifications_outlined,
                      color: AppColors.textPrimary, size: 20),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // --- Search bar ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: AppColors.textPrimary),
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  hintText: 'Search by vehicle or name...',
                  prefixIcon: Icon(Icons.search, color: AppColors.textMuted),
                  suffixIcon:
                      Icon(Icons.tune, color: AppColors.textMuted, size: 18),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // --- List ---
            Expanded(
              child: RefreshIndicator(
                onRefresh: _load,
                color: AppColors.limeAccent,
                backgroundColor: AppColors.surface,
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.limeAccent),
                      )
                    : _errorMessage != null
                        ? ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              const SizedBox(height: 80),
                              Center(
                                child: Text(_errorMessage!,
                                    style: AppTextStyles.bodySecondary),
                              ),
                            ],
                          )
                        : _filteredVehicles.isEmpty
                            ? ListView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                children: [
                                  const SizedBox(height: 80),
                                  Center(
                                    child: Text(
                                        'No vehicles ready for delivery',
                                        style: AppTextStyles.bodySecondary),
                                  ),
                                ],
                              )
                            : ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                itemCount: _filteredVehicles.length,
                                itemBuilder: (context, index) {
                                  final job = _filteredVehicles[index];
                                  return DeliveryReadyCard(
                                    jobNumber: job['job_number'] ?? '',
                                    vehicleModel:
                                        '${job['vehicle_number'] ?? ''} ${job['service_type'] ?? ''}',
                                    customerName: job['customer_name'] ?? '',
                                    customerPhone: job['customer_phone'] ?? '',
                                    footnote: index ==
                                            _filteredVehicles.length - 1
                                        ? 'Quality Check Cleared • Final detailing complete'
                                        : null,
                                    onMarkDelivered: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              CompleteDeliveryScreen(
                                            jobId: job['id'],
                                            jobNumber:
                                                job['job_number'] ?? '',
                                            vehicleLabel:
                                                job['vehicle_number'] ?? '',
                                            customerName:
                                                job['customer_name'] ?? '',
                                          ),
                                        ),
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
      bottomNavigationBar:
          const RoleBottomNav(role: 'cashier', activeIndex: 2),
    );
  }
}
