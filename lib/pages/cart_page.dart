import "package:flutter/material.dart";
import "package:flutter_catalog/Models/cart.dart";
import "package:flutter_catalog/widgets/theme.dart";
import "package:velocity_x/velocity_x.dart";

// ignore: camel_case_types
class cartPage extends StatelessWidget {
  const cartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.cardColor,
      appBar: AppBar(
        backgroundColor: context.theme.canvasColor,
        title: "Cart".text.color(context.theme.hintColor).make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({super.key});
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "Rs ${_cart.totalPrice}"
              .text
              .xl5
              .color(context.theme.hintColor)
              .make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: "Buying Option is not Supported yet"
                            .text
                            .color(context.theme.hintColor)
                            .make(),
                        backgroundColor: context.theme.canvasColor,
                      ),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          context.theme.highlightColor)),
                  child: "Buy".text.color(context.theme.hintColor).make())
              .w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Cart Empty".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline_outlined),
                  onPressed: () {
                    _cart.remove(_cart.items[index]!);
                    setState(() {});
                  },
                ),
                title: _cart.items[index]!.name.text
                    .color(context.theme.hintColor)
                    .make()),
          );
  }
}
