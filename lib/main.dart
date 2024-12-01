import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/di.dart';

import 'presentation/provider/orders_provider.dart';
import 'presentation/screens/main_screen.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Insights',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
          create: (_) => getIt<OrdersProvider>()..loadOrders(),
          child: const MainScreen()),
    );
  }
}
