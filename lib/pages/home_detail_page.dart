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
      appBar: AppBar(),
      backgroundColor: myTheme.lightpurple,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "Rs.${catalog.price}".text.bold.xl.purple700.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: "Buy".text.make(),
            ).wh(100, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image),
          ).h32(context),
          Expanded(
              child: VxArc(
                  height: 30.0,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(children: [
                      catalog.name.text.xl4
                          .color(const Color.fromARGB(250, 0, 0, 0))
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                    ]).py64(),
                  )))
        ],
      )),
    );
  }
}
