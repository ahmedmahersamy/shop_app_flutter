import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class Order {
  final String id;
  final double amount;
  final List<Cart> cartProducts;
  final DateTime dateTime;

  Order({
    @required this.id,
    @required this.amount,
    @required this.cartProducts,
    @required this.dateTime,
  });
}

class OrderProvider with ChangeNotifier {
  List<Order> _orderItems = [];

  List<Order> get orders {
    return [..._orderItems];
  }

  void addOrder(List<Cart> cartProducts, double total) {
    _orderItems.insert(
        0,
        Order(
          id: DateTime.now().toString(),
          amount: total,
          cartProducts: cartProducts,
          dateTime: DateTime.now(),
        ));
    notifyListeners();
  }


}
