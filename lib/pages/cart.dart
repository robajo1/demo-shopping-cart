// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child: Text("Cart")),
      ),
      body: const Center(
        child: Text("nothing to see here :)"),
      ),
    );
  }
}
