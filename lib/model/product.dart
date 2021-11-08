import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  late final String id;
  late final String title;
  late final String description;
  late final double price;
  late final String imageUrl;
  late bool isFavourite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavourite = false});

  void toggleFavouriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
