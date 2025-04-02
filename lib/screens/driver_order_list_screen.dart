import 'package:assignments/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/delivery_order.dart';
import '../providers/order_provider.dart';
import '../widgets/order_list_card.dart';
import '../screens/driver_order_details_screen.dart';
import '../generated/app_localizations.dart';  // Keep only this one localization import

// Remove the duplicate import of l10n.dart
class DriverOrderListScreen extends StatefulWidget {
  const DriverOrderListScreen({Key? key}) : super(key: key);

  @override
  State<DriverOrderListScreen> createState() => _DriverOrderListScreenState();
}

class _DriverOrderListScreenState extends State<DriverOrderListScreen> {
  bool _isLoading = true;
  List<DeliveryOrder> _orders = [];
  String _sortBy = 'sequence';

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _orders = Provider.of<OrderProvider>(context, listen: false).orders;
        _isLoading = false;
      });
    }
  }

  void _sortOrders(String sortType) {
    setState(() {
      _sortBy = sortType;
      _orders = Provider.of<OrderProvider>(context, listen: false).orders;
      if (sortType == 'sequence') {
        _orders.sort((a, b) => a.sequenceNumber.compareTo(b.sequenceNumber));
      } else {
        _orders.sort((a, b) => a.status.index.compareTo(b.status.index));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.todaysDeliveries),
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: (Locale locale) {
              final navigator = Navigator.of(context);
              navigator.push(
                MaterialPageRoute(
                  builder: (context) => Builder(
                    builder: (context) {
                      return Localizations.override(
                        context: context,
                        locale: locale,
                        child: const DriverOrderListScreen(),
                      );
                    },
                  ),
                ),
              );
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
              const PopupMenuItem<Locale>(
                value: Locale('en'),
                child: Text('English'),
              ),
              const PopupMenuItem<Locale>(
                value: Locale('hi'),
                child: Text('हिंदी'),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, child) {
          if (!_isLoading) {
            _orders = orderProvider.orders;
            if (_sortBy == 'sequence') {
              _orders.sort((a, b) => a.sequenceNumber.compareTo(b.sequenceNumber));
            } else {
              _orders.sort((a, b) => a.status.index.compareTo(b.status.index));
            }
          }
          
          return Column(
            children: [
              _buildDateHeader(),
              _buildSortingControls(),
              Expanded(
                child: _buildOrdersList(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDateHeader() {
    final today = DateTime.now();
    final dateFormat = DateFormat('EEEE, MMMM d, yyyy');
    
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        dateFormat.format(today),
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildSortingControls() {
    final l10n = AppLocalizations.of(context)!;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          ChoiceChip(
            label: Text(l10n.sortBySequence),
            selected: _sortBy == 'sequence',
            onSelected: (selected) => _sortOrders('sequence'),
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: Text(l10n.sortByStatus),
            selected: _sortBy == 'status',
            onSelected: (selected) => _sortOrders('status'),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList() {
    final l10n = AppLocalizations.of(context)!;
    
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_orders.isEmpty) {
      return Center(
        child: Text(l10n.noOrders),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _orders.length,
      itemBuilder: (context, index) {
        final order = _orders[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: OrderListCard(
            order: order,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DriverOrderDetailsScreen(orderId: order.id),
              ),
            ),
          ),
        );
      },
    );
  }

  List<DeliveryOrder> _generateMockOrders() {
    // Mock data generation
    return List.generate(
      10,
      (index) => DeliveryOrder(
        id: 'ORDER${index + 1}',
        customerName: 'Customer ${index + 1}',
        address: '123 Street ${index + 1}, Area ${index + 1}',
        status: DeliveryStatus.values[index % 3],
        sequenceNumber: '${index + 1}',  // Convert to String
        timeSlot: '${9 + (index % 8)}:00 - ${10 + (index % 8)}:00',
      ),
    );
  }
}