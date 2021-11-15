import 'package:e_cart/feature/order_history/provider/orders.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class OrderHistoryItem extends StatefulWidget {
  late OrderItem anOrderItem;

  OrderHistoryItem(this.anOrderItem, {Key? key}) : super(key: key);

  @override
  State<OrderHistoryItem> createState() => _OrderHistoryItemState();
}

class _OrderHistoryItemState extends State<OrderHistoryItem> {
  var expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              child: Text('\$'),
            ),
            title: Text("Order No: " + widget.anOrderItem.id),
            subtitle: Text("Order Time: " +
                DateFormat('dd MM yyyy hh:mm')
                    .format(widget.anOrderItem.dateTime) +
                "Total Amount: " +
                widget.anOrderItem.amount.toString()),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                icon: Icon(expanded ? Icons.expand_less : Icons.expand_more)),
          ),
          if (expanded)
            Container(
              height: min(widget.anOrderItem.products.length * 20.0 + 20, 180),
              child: ListView(
                children: widget.anOrderItem.products
                    .map((prod) => Column(
                          children: [
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  prod.title,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Quantity: ${prod.quantity} * Price: ${prod.price} = ${prod.quantity * prod.price}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
