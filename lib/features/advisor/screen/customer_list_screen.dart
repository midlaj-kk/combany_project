import 'package:auto_care_app/features/advisor/data/models/customer_model.dart';
import 'package:auto_care_app/features/advisor/presentation/bloc/customer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/customer_card.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Cached so transient states (vehicles lookup, refresh) never blank the list.
  List<CustomerModel> _customers = const [];
  Map<int, int> _vehicleCounts = const {};
  bool _hasLoadedOnce = false;

  @override
  void initState() {
    super.initState();
    context.read<CustomerBloc>().add(const CustomersLoadRequested());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadCustomers() {
    context.read<CustomerBloc>().add(
      CustomersLoadRequested(search: _searchController.text.trim()),
    );
  }

  void _onSearchSubmitted(String _) => _loadCustomers();

  void _openCustomer(CustomerModel customer) {
    context.read<CustomerBloc>().add(
      CustomerVehiclesLoadRequested(customerId: customer.id),
    );
  }

  void _onStateChanged(BuildContext context, CustomerState state) {
    if (state is CustomersLoaded) {
      setState(() {
        _customers = state.customers.results;
        _vehicleCounts = state.vehicleCounts;
        _hasLoadedOnce = true;
      });
    } else if (state is CustomerVehiclesLoaded) {
      final vehicles = state.vehicles;
      if (vehicles.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No vehicles registered for this customer')),
        );
        return;
      }
      AppRouter.toVehicleDetail(context, vehicleId: vehicles.first.id).then((_) {
        if (!mounted) return;
        // Restore authoritative list state after returning from detail.
        _loadCustomers();
      });
    } else if (state is CustomerError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocConsumer<CustomerBloc, CustomerState>(
          listener: _onStateChanged,
          listenWhen: (previous, current) =>
              current is CustomersLoaded ||
              current is CustomerVehiclesLoaded ||
              current is CustomerError,
          builder: (context, state) {
            final isFetching = state is CustomerLoading && !_hasLoadedOnce;

            return Column(
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
                        '${_customers.length} Total',
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
                    onRefresh: () async {
                      _loadCustomers();
                    },
                    color: AppColors.limeAccent,
                    backgroundColor: AppColors.surface,
                    child: isFetching
                        ? const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.limeAccent),
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
                                    name: customer.name,
                                    phone: customer.phone,
                                    vehicleCount:
                                        _vehicleCounts[customer.id] ?? 0,
                                    onTap: () => _openCustomer(customer),
                                  );
                                },
                              ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await AppRouter.toAddCustomer(context);
          if (!mounted) return;
          _loadCustomers();
        },
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
