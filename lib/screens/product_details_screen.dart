import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;

  static const routeName = '/product-detail';

  ProductDetailScreen({this.title});
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
        actions: [],
      ),
    );
  }
}
