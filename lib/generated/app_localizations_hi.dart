import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'डिलीवरी ऐप';

  @override
  String orderDetailsTitle(String orderId) {
    return 'ऑर्डर विवरण $orderId';
  }

  @override
  String get customerName => 'ग्राहक का नाम';

  @override
  String get deliveryAddress => 'डिलीवरी का पता';

  @override
  String get orderStatus => 'ऑर्डर की स्थिति';

  @override
  String get timeSlot => 'समय स्लॉट';

  @override
  String get sequenceNumber => 'क्रम संख्या';

  @override
  String get updateStatus => 'स्थिति अपडेट करें';

  @override
  String get pending => 'लंबित';

  @override
  String get inProgress => 'प्रगति में';

  @override
  String get delivered => 'वितरित';

  @override
  String get todaysDeliveries => 'आज की डिलीवरी';

  @override
  String get sortBySequence => 'क्रम से क्रमबद्ध करें';

  @override
  String get sortByStatus => 'स्थिति से क्रमबद्ध करें';

  @override
  String get noOrders => 'आज के लिए कोई ऑर्डर असाइन नहीं किया गया';
}
