import '../entities/order_entity.dart';

abstract class OrdersRepo {
  Future<List<Order>> getOrders();
}
