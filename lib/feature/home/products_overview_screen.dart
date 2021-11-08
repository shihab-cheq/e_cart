import 'package:e_cart/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:e_cart/model/product.dart';

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyShop'),
        ),
        body: ProductGrid());
  }
}
