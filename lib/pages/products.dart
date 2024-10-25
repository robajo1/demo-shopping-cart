// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/productDetail.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart/pages/information.dart';
import 'package:shopping_cart/pages/sheet.dart';
import 'package:shopping_cart/provider/cartprovider.dart';

class products extends StatefulWidget {
  String product_name = "";
  products({super.key, required this.product_name});

  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {
  List<Productdetail> product = [];
  late Future<void> productFuture;
  final double bottomSheetHeight = 80.h;
  @override
  void initState() {
    super.initState();
    productFuture = getproduct();
  }

  Future<void> getproduct() async {
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
              : data['price'],
          title: data['title'],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasItemsInCart = context.watch<Cartprovider>().size() > 0;

    return Scaffold(
      backgroundColor: Color.fromARGB(222, 106, 133, 243),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(142, 33, 149, 243),
        title: Center(
          child: Text(widget.product_name),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            bottom: hasItemsInCart
                ? bottomSheetHeight
                : 0), //padding the size of the sheet so that info won't get hidden
        child: FutureBuilder(
          future: productFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                itemCount: product.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 5.h,
                  crossAxisCount: 2,
                  childAspectRatio: 0.5,
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
      ),
      bottomSheet: hasItemsInCart
          ? SizedBox(height: bottomSheetHeight, child: const Sheet())
          : null,
    );
  }
}
