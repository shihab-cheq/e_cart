import 'package:e_cart/feature/home/provider/products_provider.dart';
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
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.start,
                softWrap: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              width: double.infinity,
              child: Text(
                "Price: \$${product.price}",
                textAlign: TextAlign.start,
                softWrap: true,
              ),
            )
          ]),
        ));
  }
}
