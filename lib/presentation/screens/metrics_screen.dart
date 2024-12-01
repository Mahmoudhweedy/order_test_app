import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/orders_provider.dart';
import '../widgets/metric_card.dart';

class MetricsScreen extends StatelessWidget {
  const MetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Insights')),
      body: Consumer<OrdersProvider>(
        builder: (context, provider, child) {
          final metrics = provider.orderMetrics;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MetricCard(
                  title: 'Total Orders',
                  value: metrics.totalCount.toString(),
                  icon: Icons.shopping_cart,
                  color: Colors.blue,
                ),
                const SizedBox(height: 16),
                MetricCard(
                  title: 'Average Order Value',
                  value: '\$${metrics.averagePrice.toStringAsFixed(2)}',
                  icon: Icons.attach_money,
                  color: Colors.green,
                ),
                const SizedBox(height: 16),
                MetricCard(
                  title: 'Total Returns',
                  value: metrics.returnsCount.toString(),
                  icon: Icons.restore,
                  color: Colors.red,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
