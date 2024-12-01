import 'package:test_app/data/data_source/local_data_source.dart';
import 'package:test_app/data/models/order_model.dart';
import 'package:test_app/domain/entities/order_entity.dart';

import '../../domain/repository/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersLocalDataSource localDataSource;

  OrdersRepoImpl(this.localDataSource);

  @override
  Future<List<Order>> getOrders() async {
    try {
      final result = await localDataSource.getOrders();
      final orders = result.map((json) => OrderModel.fromJson(json)).toList();
      return orders;
    } catch (e) {
      return [];
    }
  }
}
