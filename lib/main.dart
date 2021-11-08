import 'package:e_cart/providers/products_provider.dart';
import 'package:e_cart/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/home/products_overview_screen.dart';
import 'feature/details/product_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        title: 'E-Cart',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.purpleAccent,
            fontFamily: 'Lato'),
        home: ProductsOverviewScreen(),
        routes: {
          Routes.PRODUCT_DETIALS: (ctx) => ProductDetailsScreen(),
        },
      ),
    );
  }
}
