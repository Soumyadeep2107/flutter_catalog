import 'package:flutter/material.dart';
import 'package:flutter_catalog/Models/catalog.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({super.key, required this.catalog});
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.theme.canvasColor,
      bottomNavigationBar: Container(
        color: context.theme.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "Rs.${catalog.price}".text.bold.xl.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.highlightColor),
                  shape: MaterialStateProperty.all(
                      StadiumBorder(side: BorderSide.none))),
              child: "Add to cart".text.make(),
            ).wh(120, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image),
              ).h32(context),
              Expanded(
                  child: VxArc(
                      arcType: VxArcType.convey,
                      edge: VxEdge.top,
                      height: 30.0,
                      child: Container(
                        color: context.theme.cardColor,
                        width: context.screenWidth,
                        child: Column(children: [
                          catalog.name.text.xl4
                              .color(context.theme.hintColor)
                              .bold
                              .make(),
                          catalog.desc.text
                              .textStyle(context.captionStyle)
                              .xl
                              .make(),
                          10.heightBox,
                          catalog.about.text.xs
                              .textStyle(context.captionStyle)
                              .make()
                              .p16()
                        ]).py64(),
                      )))
            ],
          )),
    );
  }
}
