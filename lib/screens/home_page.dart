// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: MyTheme.darkBluishColor,
          child: Icon(CupertinoIcons.cart),
        ).badge(
          color: Colors.red,
          size: 20,
          count: _cart.items!.length,
        ),
        mutations: {AddMutation, RemoveMutation},
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            Expanded(
              child: (CatalogModel.items.isNotEmpty)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: CatalogModel.items.length,
                      itemBuilder: (context, index) {
                        final catalog = CatalogModel.items[index];
                        return ItemWidget(item: catalog);
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            )
          ],
        ),
      )),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Catalog App",
          style: TextStyle(
              color: Color(0xff403b58),
              fontSize: 44,
              fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Trending products",
          style: TextStyle(fontSize: 20, color: Color(0xff403b58)),
        )
      ],
    );
  }
}
