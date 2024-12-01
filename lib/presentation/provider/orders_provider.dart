import 'package:flutter/foundation.dart';
import 'package:test_app/domain/entities/order_entity.dart';
import 'package:test_app/domain/usecase/order_use_case.dart';

import '../../domain/entities/order_metrics.dart';

class OrdersProvider with ChangeNotifier {
  final GetOrdersUseCase getOrdersUseCase;
  OrdersProvider(this.getOrdersUseCase);

  List<Order> _orders = [];
  OrderMetrics _orderMetrics =
      OrderMetrics(totalCount: 0, averagePrice: 0.0, returnsCount: 0);
  Map<DateTime, int> _orderCountByDate = {};

  List<Order> get orders => _orders;
  OrderMetrics get orderMetrics => _orderMetrics;
  Map<DateTime, int> get orderCountByDate => _orderCountByDate;

  Future<void> loadOrders() async {
    _orders = await getOrdersUseCase();
    _orderMetrics = calculateMetrics(_orders);
    _orderCountByDate = getOrderCountByDate(_orders);
    notifyListeners();
  }

  OrderMetrics calculateMetrics(List<Order> orders) {
    final totalCount = orders.length;
    final totalPrice = orders.map((o) => o.priceDouble).reduce((a, b) => a + b);
    final averagePrice = totalCount > 0 ? totalPrice / totalCount : 0.0;
    final returnsCount = orders.where((o) => !o.isActive).length;

    return OrderMetrics(
      totalCount: totalCount,
      averagePrice: averagePrice,
      returnsCount: returnsCount,
    );
  }

  Map<DateTime, int> getOrderCountByDate(List<Order> orders) {
    return orders.fold<Map<DateTime, int>>(
      {},
      (map, order) {
        final date = DateTime.parse(order.registered);
        final key = DateTime(date.year, date.month, date.day);
        return map..update(key, (value) => value + 1, ifAbsent: () => 1);
      },
    );
  }
}
