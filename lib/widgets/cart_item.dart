import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  late String id;
  late String title;
  late double price;
  late int quantity;

  CartItemWidget(this.id, this.title, this.price, this.quantity, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Text('\$'),
          ),
          title: Text(title),
          subtitle: Text("Unit Price: \$$price Quantity: $quantity"),
          trailing: Text("${(price * quantity)}"),
        ),
      ),
    );
  }
}
