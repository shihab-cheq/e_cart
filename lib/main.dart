import 'package:e_cart/feature/edit_product/edit_product_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:e_cart/feature/cart/cart_screen.dart';
import 'package:e_cart/feature/order_history/order_history.dart';
import 'package:e_cart/feature/cart/provider/cart.dart';
import 'package:e_cart/feature/order_history/provider/orders.dart';
import 'package:e_cart/feature/home/provider/products_provider.dart';
import 'package:e_cart/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/home/products_overview_screen.dart';
import 'feature/details/product_details_screen.dart';

void main() async{
  // Initialize Firebase.
  //Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'E-Cart',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.purpleAccent,
            fontFamily: 'Lato'),
        home: ProductsOverviewScreen(),
        routes: {
          Routes.PRODUCT_DETIALS: (ctx) => ProductDetailsScreen(),
          Routes.CART_DETAILS: (ctx) => const CartScreen(),
          Routes.ORDER_HISTORY: (ctx) => const OrderHistory(),
          Routes.EDIT_PRODUCT: (ctx) => const EditProductScreen(),
        },
      ),
    );
  }
}
