import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/product_item.dart';

class ProductGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    print(products);
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],

        //  create: (c) => products[i],
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
