import 'package:flutter/foundation.dart';
import '../models/delivery_order.dart';

class OrderProvider with ChangeNotifier {
  final Map<String, DeliveryOrder> _orders = {};

  // Add this getter
  List<DeliveryOrder> get orders => _orders.values.toList();

  OrderProvider() {
    // Initialize with mock orders
    final mockOrders = _generateMockOrders();
    for (var order in mockOrders) {
      _orders[order.id] = order;
    }
  }

  DeliveryOrder? getOrder(String id) => _orders[id];

  void updateOrderStatus(String orderId, DeliveryStatus newStatus) {
    final order = _orders[orderId];
    if (order != null) {
      order.status = newStatus;
      notifyListeners();
    }
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
        sequenceNumber: '${index + 1}',
        timeSlot: '${9 + (index % 8)}:00 - ${10 + (index % 8)}:00',
      ),
    );
  }
}