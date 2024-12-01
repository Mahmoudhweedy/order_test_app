import 'package:test_app/domain/entities/order_entity.dart';

class OrderModel extends Order {
  const OrderModel({
    required super.id,
    required super.isActive,
    required super.price,
    required super.company,
    required super.picture,
    required super.buyer,
    required super.tags,
    required super.status,
    required super.registered,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      isActive: json['isActive'],
      price: json['price'],
      company: json['company'],
      picture: json['picture'],
      buyer: json['buyer'],
      tags: json['tags'],
      status: json['status'],
      registered: json['registered'],
    );
  }
}
