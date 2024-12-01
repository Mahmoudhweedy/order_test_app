import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/orders_provider.dart';

class OrdersChartScreen extends StatelessWidget {
  const OrdersChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Trends')),
      body: Consumer<OrdersProvider>(
        builder: (context, provider, child) {
          final ordersByDate = provider.orderCountByDate;
          final sortedKeys = ordersByDate.keys.toList()..sort();
          final dataPoints = sortedKeys
              .map((date) => FlSpot(
                    sortedKeys.indexOf(date).toDouble(),
                    ordersByDate[date]!.toDouble(),
                  ))
              .toList();
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: dataPoints.isNotEmpty
                ? LineChart(
                    LineChartData(
                      borderData: FlBorderData(show: false),
                      gridData: FlGridData(
                        show: true,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: Colors.grey.withOpacity(0.5),
                          strokeWidth: .5,
                        ),
                        getDrawingVerticalLine: (value) => FlLine(
                          color: Colors.grey.withOpacity(0.5),
                          strokeWidth: .5,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                style: const TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                            reservedSize: 40,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              if (index >= 0 && index < sortedKeys.length) {
                                return Transform.rotate(
                                  angle: -.7,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${sortedKeys[index].day}/${sortedKeys[index].month}',
                                    style: const TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }
                              return const Text('');
                            },
                            reservedSize: 40,
                          ),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      minY: 0,
                      lineBarsData: [
                        LineChartBarData(
                          isCurved: true,
                          color: Colors.teal,
                          dotData: const FlDotData(show: true),
                          spots: dataPoints,
                          belowBarData: BarAreaData(
                            show: true,
                            color: Colors.teal.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: Text('No Data Available'),
                  ),
          );
        },
      ),
    );
  }
}
