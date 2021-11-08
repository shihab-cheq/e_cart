import 'package:e_cart/model/product.dart';
import 'package:e_cart/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // late final String id;
  // late final String title;
  // late final String image;

  //ProductItem({required this.id, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    print('Rebuild  product item ...');

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
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
