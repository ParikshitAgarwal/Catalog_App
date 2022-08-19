import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Cart"),
        ),
        backgroundColor: MyTheme.creamColor,
        body: Column(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CartList(),
            )),
            Divider(),
            _CartTotal(),
          ],
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items!.isEmpty
        ? const Center(
            child: Text("Nothing To Show"),
          )
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              title: Text(_cart.items![index].name),
              trailing: IconButton(
                  onPressed: () {
                    RemoveMutation(_cart.items![index]);
                  },
                  icon: Icon(Icons.remove_circle_outline)),
            ),
            itemCount: _cart.items?.length,
          );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VxConsumer(
                builder: ((context, store, status) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _cart.totalPrice.toString() + "Rs",
                      style: const TextStyle(fontSize: 30),
                    ),
                  );
                }),
                mutations: {RemoveMutation}),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Buying not supported yet")));
              },
              child: const Text(
                "Buy",
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(100, 50),
                ),
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
