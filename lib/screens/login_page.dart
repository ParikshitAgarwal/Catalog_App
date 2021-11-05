import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeBtn = false;
  String name = "";
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
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
                    setState(() {
                      name = value;
                    });
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
              setState(() {
                changeBtn = true;
              });
              await Future.delayed(Duration(seconds: 1));
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: 50,
              width: changeBtn ? 50 : 150,
              child: changeBtn
                  ? const Icon(Icons.done)
                  : const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(changeBtn ? 50 : 8),
              ),
              alignment: Alignment.center,
            ),
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       print("pressed");
          //     },
          //     child: Text("Login"))
        ],
      ),
    );
  }
}
