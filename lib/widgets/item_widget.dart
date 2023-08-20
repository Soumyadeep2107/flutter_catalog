import 'package:flutter/material.dart';
import 'package:flutter_catalog/Models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  //basically its a constructor
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2.0,
        child: ListTile(
          onTap: () {
            print("${item.name}pressed");
          },
          leading: Image.network(item.image),
          title: Text(
            item.name,
            style: const TextStyle(fontSize: 15),
          ),
          subtitle: Text(
            item.desc,
            style: const TextStyle(fontSize: 12),
          ),
          trailing: Text(
            "Rs. ${item.price}",
            textScaleFactor: 1.5,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
