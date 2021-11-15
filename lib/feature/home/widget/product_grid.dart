import 'package:e_cart/feature/home/provider/products_provider.dart';
import 'package:e_cart/feature/home/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  bool showFavs = false;

  ProductGrid({required this.showFavs});

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Products>(context);
    var loadedProducts = showFavs ? product.favItems : product.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: ProductItem(),
      ),
    );
  }
}
