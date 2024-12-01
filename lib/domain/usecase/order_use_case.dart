import 'package:test_app/domain/entities/order_entity.dart';
import 'package:test_app/domain/repository/orders_repo.dart';

class GetOrdersUseCase {
  final OrdersRepo repository;

  const GetOrdersUseCase(this.repository);
  Future<List<Order>> call() => repository.getOrders();
}
