import 'package:flutter/material.dart';
import '../models/delivery_order.dart';

class OrderListCard extends StatelessWidget {
  final DeliveryOrder order;
  final VoidCallback onTap;

  const OrderListCard({
    Key? key,
    required this.order,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order #${order.sequenceNumber}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  _buildStatusChip(context),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                order.customerName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 4),
              Text(
                order.address,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              Text(
                order.timeSlot,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    Color backgroundColor;
    String statusText;

    switch (order.status) {
      case DeliveryStatus.pending:
        backgroundColor = Colors.orange;
        statusText = 'Pending';
        break;
      case DeliveryStatus.inProgress:
        backgroundColor = Colors.blue;
        statusText = 'In Progress';
        break;
      case DeliveryStatus.delivered:
        backgroundColor = Colors.green;
        statusText = 'Delivered';
        break;
    }

    return Chip(
      backgroundColor: backgroundColor.withOpacity(0.2),
      label: Text(
        statusText,
        style: TextStyle(color: backgroundColor),
      ),
    );
  }
}