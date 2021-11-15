import 'package:e_cart/feature/cart/provider/cart.dart';
import 'package:flutter/foundation.dart';

class OrderItem {
  late String id;
  late double amount;
  late List<CartItem> products;
  late DateTime dateTime;

  OrderItem({required this.id,
    required this.amount,
    required this.products,
    required this.dateTime});
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(0, OrderItem(id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now()));
    notifyListeners();
  }
}
