import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:'https://images.unsplash.com/photo-1471286174890-9c112ffca5b4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80'
          //'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
              'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1868&q=80'
    ),
    Product(
      id: 'p3',
      title: 'Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://images.unsplash.com/photo-1601244005535-a48d21d951ac?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c2NhcmZ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ),
    Product(
      id: 'p4',
      title: 'Sunglasses',
      description: 'Be more fashion.',
      price: 49.99,
      imageUrl:
          'https://images.unsplash.com/photo-1473496169904-658ba7c44d8a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    ),
  ];
//var _showFavoritesOnly =false;

  List<Product> get items {
    // if (_showFavoritesOnly)
    //   {
    //     return _items.where((productItem) => productItem.isFavorite).toList();
    //   }
      return [..._items]; //return a copy of the items list
  }

  List<Product> get favoriteItems {
      return _items.where((productItem) => productItem.isFavorite ).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
   /* void showFavoriteOnly()
    {
      _showFavoritesOnly =true;
      notifyListeners();
    }
    void showAll()
    {
      _showFavoritesOnly =false;
      notifyListeners();
    }
*/
  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}
