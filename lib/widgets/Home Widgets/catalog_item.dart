import 'package:flutter/material.dart';
import 'package:flutter_catalog/Models/catalog.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/widgets/Home%20Widgets/catalog_image.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

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
              catalog.name.text.lg.bold.make(),
              catalog.desc.text
                  .fontWeight(FontWeight.bold)
                  .xs
                  .textStyle(context.captionStyle)
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
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.deepPurple,
                        ),
                        shape: MaterialStateProperty.all(
                          const StadiumBorder(),
                        )),
                    child: "Add to Cart".text.xs.make(),
                  ),
                ],
              ).pOnly(right: 8.0, top: 0)
            ],
          ))
        ],
      ),
    )).white.roundedSM.square(110).make().py16();
  }
}
