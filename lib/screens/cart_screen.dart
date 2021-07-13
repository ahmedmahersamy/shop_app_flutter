import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart.dart';
import 'package:shop_app_flutter/providers/order.dart';
import 'package:shop_app_flutter/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cartProvider.totalPriceAmount.toStringAsFixed(2)}',
                      style: Theme.of(context).primaryTextTheme.headline6,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    child: Text('ORDER NOW'),
                    style: TextButton.styleFrom(
                      textStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      Provider.of<OrderProvider>(context , listen: false).addOrder(
                        cartProvider.items.values.toList(),
                        cartProvider.totalPriceAmount,
                      );
                      cartProvider.clear();
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
              child: ListView.builder(
                  itemCount: cartProvider.items.length,
                  itemBuilder: (ctx, i) => CartItem(
                      id: cartProvider.items.values.toList()[i].id,
                      productId: cartProvider.items.keys.toList()[i],
                      title: cartProvider.items.values.toList()[i].title,
                      quantity: cartProvider.items.values.toList()[i].quantity,
                      price: cartProvider.items.values.toList()[i].price)))
        ],
      ),
    );
  }
}
