import 'package:e_cart/providers/orders.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderHistoryItem extends StatelessWidget {
  late OrderItem anOrderItem;

  OrderHistoryItem(this.anOrderItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: const CircleAvatar(
            child: Text('\$'),
          ),
          title: Text("Order No: " + anOrderItem.id),
          subtitle: Text("Order Time: " +
              DateFormat('dd MM yyyy hh:mm').format(anOrderItem.dateTime)),
          trailing: Text("Total Amount: ${(anOrderItem.amount)}"),
        ),
      ),
    );
  }
}
