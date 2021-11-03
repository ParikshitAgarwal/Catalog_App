import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeBtn = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Image.asset(
            "assets/images/login_img.png",
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Welcome $name",
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter password",
                    labelText: "password",
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              // ignore: avoid_print
              setState(() {
                changeBtn = true;
              });
              await Future.delayed(const Duration(seconds: 1));
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
            child: AnimatedContainer(
              height: 40,
              width: changeBtn ? 40 : 150,
              alignment: Alignment.center,
              duration: const Duration(seconds: 1),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: changeBtn
                    ? BorderRadius.circular(40)
                    : BorderRadius.circular(8),
              ),
              child: changeBtn
                  ? const Icon(Icons.done)
                  : const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
            ),
          )
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, MyRoutes.homeRoute);
          //       print("pressed");
          //     },
          //     child: Text("Login"))
        ],
      ),
    );
  }
}
