import 'package:e_cart/model/product.dart';
import 'package:e_cart/providers/products_provider.dart';
import 'package:e_cart/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var product = Provider.of<Products>(context);
    var loadedProducts = product.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (context) => loadedProducts[i],
        child: ProductItem(
          // id: loadedProducts[i].id,
          // title: loadedProducts[i].title,
          // image: loadedProducts[i].imageUrl,
        ),
      ),
    );
  }
}