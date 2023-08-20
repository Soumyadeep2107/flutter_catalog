import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/widgets/theme.dart';

class CatalogImage extends StatelessWidget {
  const CatalogImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .roundedSM
        .p12
        .color(myTheme.lightpurple)
        .make()
        .p12()
        .w40(context);
  }
}
