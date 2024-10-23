// ignore_for_file: camel_case_types, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_cart/model/productDetail.dart';
import 'package:http/http.dart' as http;

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
                crossAxisSpacing: 3.h,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(4.w, 4.h),
                          blurRadius: 5,
                        )
                      ],
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15.h),
                    ),
                    margin: EdgeInsets.all(3.h),
                    height: 400.h,
                    width: 20.w,
                    child: Center(
                      child: Text(product[index].title),
                    ),
                  ),
                );
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
