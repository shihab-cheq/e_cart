import 'package:e_cart/utils/routes.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('E-Cart'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.HOME_SCREEN);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.ORDER_HISTORY);
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Edit Product'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.EDIT_PRODUCT);
            },
          )
        ],
      ),
    );
  }
}
