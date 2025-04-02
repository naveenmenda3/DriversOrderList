import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../generated/app_localizations.dart';
import '../models/delivery_order.dart';
import '../providers/order_provider.dart';

class DriverOrderDetailsScreen extends StatelessWidget {
  final String orderId;

  const DriverOrderDetailsScreen({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final order = context.watch<OrderProvider>().getOrder(orderId);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.orderDetailsTitle(orderId)),
      ),
      body: order == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoCard(
                    context,
                    title: l10n.customerName,
                    content: order.customerName,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    context,
                    title: l10n.deliveryAddress,
                    content: order.address,
                  ),
                  const SizedBox(height: 16),
                  _buildStatusSection(context, order, l10n),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    context,
                    title: l10n.timeSlot,
                    content: order.timeSlot,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    context,
                    title: l10n.sequenceNumber,
                    content: '#${order.sequenceNumber}',
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusSection(
    BuildContext context,
    DeliveryOrder order,
    AppLocalizations l10n,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.orderStatus,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildStatusChip(context, DeliveryStatus.pending, order.status, l10n),
                const SizedBox(width: 8),
                _buildStatusChip(context, DeliveryStatus.inProgress, order.status, l10n),
                const SizedBox(width: 8),
                _buildStatusChip(context, DeliveryStatus.delivered, order.status, l10n),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showStatusUpdateDialog(context, order, l10n);
                },
                child: Text(l10n.updateStatus),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(
    BuildContext context,
    DeliveryStatus status,
    DeliveryStatus currentStatus,
    AppLocalizations l10n,
  ) {
    final isSelected = status == currentStatus;
    final statusText = _getStatusText(status, l10n);

    return Chip(
      backgroundColor: isSelected
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.surface,
      label: Text(
        statusText,
        style: TextStyle(
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  String _getStatusText(DeliveryStatus status, AppLocalizations l10n) {
    switch (status) {
      case DeliveryStatus.pending:
        return l10n.pending;
      case DeliveryStatus.inProgress:
        return l10n.inProgress;
      case DeliveryStatus.delivered:
        return l10n.delivered;
    }
  }

  Future<void> _showStatusUpdateDialog(
    BuildContext context,
    DeliveryOrder order,
    AppLocalizations l10n,
  ) async {
    final selectedStatus = await showDialog<DeliveryStatus>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.updateStatus),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: DeliveryStatus.values.map((status) {
            return ListTile(
              title: Text(_getStatusText(status, l10n)),
              onTap: () => Navigator.pop(context, status),
            );
          }).toList(),
        ),
      ),
    );

    if (selectedStatus != null && context.mounted) {
      context.read<OrderProvider>().updateOrderStatus(orderId, selectedStatus);
    }
  }
}