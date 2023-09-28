import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/Models/cart.dart';
import 'package:flutter_catalog/Models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => AddToCartState();
}

class AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool IsIncart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!IsIncart) {
          IsIncart = IsIncart.toggle();
          final catalog = CatalogModel();
          final cart = CartModel();
          cart.catalog = catalog;
          cart.add(widget.catalog);
          setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            context.theme.highlightColor,
          ),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          )),
      child: IsIncart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
