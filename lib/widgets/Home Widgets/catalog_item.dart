// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_catalog/Models/catalog.dart';
import 'package:flutter_catalog/widgets/Home%20Widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Add_to_cart.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Expanded(
      child: Row(
        // mainAxisSize: MainAxisSize.max,

        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.bold.color(context.theme.hintColor).make(),
              catalog.desc.text
                  .fontWeight(FontWeight.bold)
                  .xs
                  .textStyle(context.captionStyle)
                  .color(context.theme.hintColor)
                  .make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "Rs.${catalog.price}"
                      .text
                      .bold
                      .color(const Color.fromARGB(255, 155, 28, 19))
                      .size(10.0)
                      .make(),
                  AddToCart(catalog: catalog),
                ],
              ).pOnly(right: 8.0, top: 0)
            ],
          ))
        ],
      ),
    )).color(context.cardColor).roundedSM.square(110).make().py16();
  }
}
