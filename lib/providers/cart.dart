import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Cart {
  final String id;
  final String title;
  final int quantity;
  final double price;

  Cart(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class CartProvider with ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

// get total amount for all cart orders
  double get totalPriceAmount {
    var total = 0.0;
    _items.forEach((key, cart) {
      total += cart.price * cart.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => Cart(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
      //change quantity
    } else {
      _items.putIfAbsent(
          productId,
          () => Cart(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
      //Add new Item

    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleQuantityItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
          productId,
          (existingCartItem) => Cart(
                id: existingCartItem.id,
                title: existingCartItem.title,
                quantity: existingCartItem.quantity - 1,
                price: existingCartItem.price,
              ));
    }else
      {
        _items.remove(productId);
      }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
