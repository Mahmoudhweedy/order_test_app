import 'package:flutter/material.dart';

import 'metrics_screen.dart';
import 'order_chart_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order Insights'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.dashboard), text: 'Metrics'),
              Tab(icon: Icon(Icons.show_chart), text: 'Order Trends'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MetricsScreen(),
            OrdersChartScreen(),
          ],
        ),
      ),
    );
  }
}
