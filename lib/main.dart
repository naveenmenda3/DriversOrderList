import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'generated/app_localizations.dart';  // Update this line
import 'providers/order_provider.dart';
import 'screens/driver_order_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => OrderProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'), // Default locale
      home: const DriverOrderListScreen(),
    );
  }
}