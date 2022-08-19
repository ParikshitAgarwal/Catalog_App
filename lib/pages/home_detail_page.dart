import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/add_to_Cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          ButtonBar(alignment: MainAxisAlignment.spaceAround, children: [
        Text(
          catalog.price.toString() + "Rs",
          style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent),
        ),
        const SizedBox(
          width: 100,
        ),
        AddToCart(catalog: catalog)
      ]),
      appBar: AppBar(
        backgroundColor: MyTheme.creamColor,
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(
                    catalog.image,
                    width: 300,
                    height: 200,
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
                child: Column(
              children: [
                Text(
                  catalog.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  catalog.desc,
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "Est clita at amet sadipscing aliquyam dolor sanctus ipsum dolor, elitr labore sit diam aliquyam dolore est et. Sea no et stet justo kasd, dolores diam rebum ipsum dolore stet, magna elitr lorem dolore justo. Et amet aliquyam justo sed tempor amet, et aliquyam nonumy rebum sit dolore sit at.",
                      style: TextStyle(color: Colors.blueGrey, fontSize: 12)),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
