import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final bool isActive;
  final String price;
  final String company;
  final String picture;
  final String buyer;
  final List<dynamic> tags;
  final String status;
  final String registered;

  const Order({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });
  double get priceDouble {
    return double.parse(price.replaceAll(r'$', '').replaceAll(',', ''));
  }

  List<String> get tagList {
    return tags.map((tag) => '$tag').toList();
  }

  @override
  List<Object?> get props => [
        id,
        isActive,
        price,
        company,
        picture,
        buyer,
        tags,
        status,
        registered,
      ];
}
