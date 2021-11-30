import 'package:e_cart/feature/cart/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  late String id;
  late String title;
  late double price;
  late int quantity;

  CartItemWidget(this.id, this.title, this.price, this.quantity, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Are you sure?"),
                  content:
                      const Text("Do you want to remove the item from cart?"),
                  actions: [
                    TextButton(onPressed: () {
                      Navigator.of(context).pop(true);
                    }, child: const Text("Yes")),
                    TextButton(onPressed: () {
                      Navigator.of(context).pop(false);
                    }, child: const Text("No")),
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(id);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: const CircleAvatar(
              child: Text('\$'),
            ),
            title: Text(title),
            subtitle: Text("Unit Price: \$$price Quantity: $quantity"),
            trailing: Text("${(price * quantity)}"),
          ),
        ),
      ),
    );
  }
}
