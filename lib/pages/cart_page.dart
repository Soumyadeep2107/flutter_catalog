import "package:flutter/material.dart";
import "package:flutter_catalog/widgets/theme.dart";
import "package:velocity_x/velocity_x.dart";

// ignore: camel_case_types
class cartPage extends StatelessWidget {
  const cartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myTheme.lightpurple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(Colors.black).make(),
      ),
    );
  }
}
