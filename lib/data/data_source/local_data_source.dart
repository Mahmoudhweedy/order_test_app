import 'dart:convert';

import 'package:flutter/services.dart';

abstract class OrdersLocalDataSource {
  Future<List> getOrders();
}

class OrdersLocalDataSourceImpl implements OrdersLocalDataSource {
  @override
  Future<List> getOrders() async {
    final jsonString = await rootBundle.loadString('assets/orders.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList;
  }
}
