import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Delivery App';

  @override
  String orderDetailsTitle(String orderId) {
    return 'Order Details $orderId';
  }

  @override
  String get customerName => 'Customer Name';

  @override
  String get deliveryAddress => 'Delivery Address';

  @override
  String get orderStatus => 'Order Status';

  @override
  String get timeSlot => 'Time Slot';

  @override
  String get sequenceNumber => 'Sequence Number';

  @override
  String get updateStatus => 'Update Status';

  @override
  String get pending => 'Pending';

  @override
  String get inProgress => 'In Progress';

  @override
  String get delivered => 'Delivered';

  @override
  String get todaysDeliveries => 'Today\'s Deliveries';

  @override
  String get sortBySequence => 'Sort by Sequence';

  @override
  String get sortByStatus => 'Sort by Status';

  @override
  String get noOrders => 'No orders assigned for today';
}
