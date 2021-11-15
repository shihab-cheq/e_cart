import 'package:e_cart/providers/orders.dart';
import 'package:e_cart/widgets/app_drawer.dart';
import 'package:e_cart/widgets/order_history_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, i) => OrderHistoryItem(orderData.orders[i]),
      ),
    );
  }
}
