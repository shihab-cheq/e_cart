import 'package:e_cart/model/product.dart';
import 'package:e_cart/feature/cart/provider/cart.dart';
import 'package:e_cart/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    //val child =
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(product.imageUrl, scale: 1, fit: BoxFit.cover),
          onTap: () {
            //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ProductDetailsScreen()));
            Navigator.of(context)
                .pushNamed(Routes.PRODUCT_DETIALS, arguments: product.id);
          },
        ),
        footer: GridTileBar(
          title: Text(product.title),
          backgroundColor: Colors.black45,
          leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(
                    icon: Icon(
                      product.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    onPressed: () {
                      product.toggleFavouriteStatus();
                    },
                    color: Theme.of(context).accentColor,
                  )),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(product.id, product.title, product.price);
              final snackBar = SnackBar(
                content: const Text('Product Added to Cart!'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // todo:  code for undo...
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
