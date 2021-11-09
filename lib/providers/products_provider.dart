import 'package:e_cart/model/product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: "1",
        title: "Mi Band 5",
        description: "description",
        price: 20,
        imageUrl:
            "https://i.picsum.photos/id/454/200/300.jpg?hmac=wGXBDB3HURz2isRdLrgggeWdD1yO3rdX4B3-jlzRncg"),
    Product(
        id: "2",
        title: "Mi watch",
        description: "description",
        price: 40,
        imageUrl:
            "https://i.picsum.photos/id/2/536/354.jpg?hmac=EVqChBVjwdZVaEJoMQgFSzZhsD72o5119rYcaw33YBo"),
    Product(
        id: "3",
        title: "Mi Mobile",
        description: "description",
        price: 60,
        imageUrl:
            "https://i.picsum.photos/id/9/536/354.jpg?hmac=5PiiV8cCMwZsDl8bYwpetFqtPuNn5uY2WcKTEb5ykW4"),
    Product(
        id: "4",
        title: "Mi AC",
        description: "description",
        price: 80,
        imageUrl:
            "https://i.picsum.photos/id/1084/536/354.jpg?grayscale&hmac=Ux7nzg19e1q35mlUVZjhCLxqkR30cC-CarVg-nlIf60")
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favItems {
      return _items.where((element) => element.isFavourite).toList();
  }

  Product getProductById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addProduct() {
    notifyListeners();
  }
}
