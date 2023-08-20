import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/Models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

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
      //will give a bar on the top of the app
      appBar: AppBar(
        title: const Text(
          "Catalog App",
          textScaleFactor: 1.5,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: GridTile(
                      header: Container(
                          decoration: const BoxDecoration(
                            color: Colors.deepPurple,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            item.name,
                            style: const TextStyle(color: Colors.white),
                          )),
                      footer: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            item.price.toString(),
                            style: const TextStyle(color: Colors.amber),
                          )),
                      child: Image.network(
                        item.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                })
            : const Center(child: CircularProgressIndicator()),
      ),

      //  Center(
      //   // her now we are doing things in the body.
      //   child: Container(
      //     child: Text("Welcome to $name's app"),
      //   ),
      // ),
      drawer:
          myDrawer(), // this will give us a hamburgger button on the top left
    );
  }
}
