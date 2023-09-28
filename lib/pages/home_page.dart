import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/Models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/Home%20Widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/Home%20Widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
// import 'package:flutter_catalog/widgets/drawer.dart';
// import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import "cart_page.dart";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final name = "Soumyadeep";

  final days = 34;

  final p = 3.14;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/images/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["Products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  final ismale = true;

  final temp = 30;
  //num take both float and integer both.
  final day = "Tuesday";

  final pi = 3.14;
  //this value can't be changed;
  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.theme.highlightColor,
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.amber,
            )),
      ),
      body: SafeArea(
          child: Container(
              padding: Vx.mH16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items!.isNotEmpty)
                    const CatalogList().expand()
                  else
                    const CircularProgressIndicator().centered().expand(),
                ],
              ))),
    );
  }
}
