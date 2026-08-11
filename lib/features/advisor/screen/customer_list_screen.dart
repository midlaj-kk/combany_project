import 'package:auto_care_app/core/demo/demo_repository.dart';
import 'package:flutter/material.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/customer_card.dart';

/// Advisor "Customers" list screen.
class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final TextEditingController _searchController = TextEditingController();

  bool _isLoading = true;
  String? _errorMessage;
  List<dynamic> _customers = [];
  int _totalCount = 0;

  @override
  void initState() {
    super.initState();
    _loadCustomers();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadCustomers() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final customers = await DemoRepository.instance
          .getCustomers(search: _searchController.text.trim());
      if (!mounted) return;
      setState(() {
        _customers = customers;
        _totalCount = customers.length;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not load customers. Pull down to retry.';
      });
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _onSearchSubmitted(String _) => _loadCustomers();

  /// Opens the first vehicle of a customer. The raw backend only
  /// returns vehicle counts, so resolve the id before navigating
  /// (previously this hardcoded vehicleId: 1, opening the wrong car).
  Future<void> _openCustomer(Map<String, dynamic> customer) async {
    try {
      final vehicles = await DemoRepository.instance
          .getCustomerVehicles(customer['id'] as int);
      if (vehicles.isEmpty || !mounted) return;
      AppRouter.toVehicleDetail(context,
          vehicleId: vehicles.first['id'] as int);
    } catch (_) {
      // Ignore — tapping again will retry.
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
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).maybePop();
                  }, icon: Icon(Icons.arrow_back)),
                  Expanded(
                    
                    child: Text('Customers', style: AppTextStyles.heading2),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      color: AppColors.limeAccent,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => AppRouter.toAddCustomer(context),
                      icon: const Icon(Icons.add,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // --- Search bar ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: AppColors.textPrimary),
                onSubmitted: _onSearchSubmitted,
                decoration: const InputDecoration(
                  hintText: 'Search by name or phone',
                  prefixIcon: Icon(Icons.search, color: AppColors.textMuted),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // --- Directory count row ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CLIENT DIRECTORY',
                    style: AppTextStyles.caption.copyWith(letterSpacing: 0.6),
                  ),
                  Text(
                    '$_totalCount Total',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.limeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // --- Customer list ---
            Expanded(
              child: RefreshIndicator(
                onRefresh: _loadCustomers,
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
                        : _customers.isEmpty
                            ? ListView(
                                physics:
                                    const AlwaysScrollableScrollPhysics(),
                                children: [
                                  const SizedBox(height: 80),
                                  Center(
                                    child: Text('No customers found',
                                        style: AppTextStyles.bodySecondary),
                                  ),
                                ],
                              )
                            : ListView.builder(
                                physics:
                                    const AlwaysScrollableScrollPhysics(),
                                padding: const EdgeInsets.fromLTRB(
                                    20, 0, 20, 100),
                                itemCount: _customers.length,
                                itemBuilder: (context, index) {
                                  final customer = _customers[index];
                                  return CustomerCard(
                                    name: customer['name'] ?? '',
                                    phone: customer['phone'] ?? '',
                                    vehicleCount:
                                        customer['vehicle_count'] ?? 0,
                                    onTap: () => _openCustomer(customer),
                                  );
                                },
                              ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => AppRouter.toAddCustomer(context),
        backgroundColor: AppColors.limeAccent,
        label: const Text(
          'Add Customer',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.person_add_alt_1, color: Colors.black),
      ),
    );
  }
}
