enum DeliveryStatus { pending, inProgress, delivered }

class DeliveryOrder {
  final String id;
  final String customerName;
  final String address;
  final String timeSlot;
  final String sequenceNumber;
  DeliveryStatus status;

  DeliveryOrder({
    required this.id,
    required this.customerName,
    required this.address,
    required this.timeSlot,
    required this.sequenceNumber,
    this.status = DeliveryStatus.pending,
  });
}