import 'package:e_cart/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  late final String title;

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    var product =
        Provider.of<Products>(context, listen: false).getProductById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
