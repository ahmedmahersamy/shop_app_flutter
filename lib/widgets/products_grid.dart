import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/product_item.dart';

class ProductGridView extends StatelessWidget {
  final  favoriteItem;
  ProductGridView(this.favoriteItem);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    print("$favoriteItem from grid clever");
    final products = this.favoriteItem? productData.favoriteItems : productData.items;
    //print(products);
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
       itemBuilder: (ctx, i) => ChangeNotifierProvider.value(value: products[i],
       /*we used change notifier provider if we need to use or send the context if not we can use it with .value */
       /*ChangeNotifierProvider(
         create: (c) => products[i],

          create: (c) => products[i],*/
        child: ProductItem(
            // id: products[i].id,
            // title: products[i].title,
            // imageUrl: products[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
