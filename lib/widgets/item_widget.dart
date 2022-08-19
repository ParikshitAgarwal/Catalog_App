import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import 'add_to_Cart.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAdded = false;
    return SizedBox(
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeDetailPage(catalog: item))),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Hero(
                  tag: Key(item.id.toString()),
                  child: Image.network(
                    item.image,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      item.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      item.desc,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.price.toString() + "Rs",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            AddToCart(catalog: item)
                          ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // child: ListTile(
      //   leading: Image.network(item.image),
      //   title: Text(item.name),
      //   subtitle: Text("${item.model} ${item.desc}"),
      //   trailing: Text(
      //     "Rs ${item.price.toString()}",
      //     textScaleFactor: 1.2,
      //     style: const TextStyle(
      //         color: Colors.deepPurple, fontWeight: FontWeight.bold),
      //   ),
      // ),
    );
  }
}
