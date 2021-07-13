import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart.dart';
import 'package:shop_app_flutter/providers/products_provider.dart';
import 'package:shop_app_flutter/screens/cart_screen.dart';
import 'package:shop_app_flutter/widgets/app_drawer.dart';
import '../widgets/cart_widget.dart';
import '../widgets/products_grid.dart';

enum filterOptions{
  Favorites,
  All
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoritesItems = false;

  @override
  Widget build(BuildContext context) {
    //final productsContainer =Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (filterOptions selectedValue) {
              setState(() {
                if(selectedValue == filterOptions.Favorites)
                {
                  print(selectedValue);

                  _showFavoritesItems = true;
                  // productsContainer.showFavoriteOnly()
                }else{

                  _showFavoritesItems = false;
                  print(selectedValue);

                  //productsContainer.showAll()
                }
              });
              },
        //print(_showFavoritesItems);

        icon: Icon(
                Icons.more_vert
            ),
           itemBuilder: (_)=>[
            PopupMenuItem(child: Text("Only Favorites") ,value: filterOptions.Favorites),
            PopupMenuItem(child: Text("Show All") ,value: filterOptions.All)
          ]),
          //Shopping Cart
          Consumer <CartProvider>(builder: (_, cartData, ch) => CartWidget(
              child: ch,
              value: cartData.itemCount.toString(),
               ),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  ),
            ),



        ],

      ),
        drawer: AppDrawer(),
        body: ProductGridView(_showFavoritesItems),
    );
  //print(_showFavoritesItems);

  }
}
