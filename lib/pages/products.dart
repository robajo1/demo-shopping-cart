// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_cart/model/productDetail.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart/pages/cart.dart';
import 'package:shopping_cart/pages/information.dart';

class products extends StatefulWidget {
  String product_name = "";
  products({super.key, required this.product_name});

  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {
  List<Productdetail> product = [];

  Future getproduct() async {
    String name = widget.product_name;

    var response = await http
        .get(Uri.https('fakestoreapi.com', 'products/category/$name'));
    var jsondata = jsonDecode(response.body);

    for (var data in jsondata) {
      product.add(
        Productdetail(
            category: data['category'],
            description: data['description'],
            image: data['image'],
            price: (data['price'] is int)
                ? (data['price'] as int).toDouble()
                : data[
                    'price'], //must be casted in to double if the price is int other wise doesn't work
            title: data['title']),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const cart(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          )
        ],
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(widget.product_name),
        ),
      ),
      body: FutureBuilder(
        future: getproduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GridView.builder(
              itemCount: product.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5.h,
                crossAxisCount: 2,
                childAspectRatio:
                    0.5, //controlls the height ratio based on the width
              ),
              itemBuilder: (context, index) {
                return Information(item: product[index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
