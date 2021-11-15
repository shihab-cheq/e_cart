import 'package:e_cart/providers/cart.dart';
import 'package:e_cart/utils/routes.dart';
import 'package:e_cart/widgets/app_drawer.dart';
import 'package:e_cart/widgets/badge.dart';
import 'package:e_cart/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions { Favourites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool showFavs = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyShop'),
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (FilterOptions selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOptions.Favourites) {
                      showFavs = true;
                    } else {
                      showFavs = false;
                    }
                  });
                },
                icon: const Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      const PopupMenuItem(
                        child: Text('Only Favorites'),
                        value: FilterOptions.Favourites,
                      ),
                      const PopupMenuItem(
                        child: Text('Show All'),
                        value: FilterOptions.All,
                      ),
                    ]),
            Consumer<Cart>(
              builder: (_, cartData, ch) => Badge(
                child: ch!,
                value: cartData.itemCount.toString(),
              ),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.CART_DETAILS);
                },
              ),
            )
          ],
        ),
        drawer: const AppDrawer(),
        body: ProductGrid(showFavs: showFavs));
  }
}
