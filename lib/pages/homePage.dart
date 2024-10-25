import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shopping_cart/pages/cart.dart';
import 'package:shopping_cart/pages/products.dart';
import 'package:shopping_cart/pages/sheet.dart';
import 'package:shopping_cart/provider/cartprovider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List catagories = [];
  final double bottomSheetHeight = 80.h;
  Future getCatagory() async {
    var response =
        await http.get(Uri.https('fakestoreapi.com', 'products/categories'));
    var jasondata = jsonDecode(response.body);
    for (var data in jasondata) {
      if (catagories.length < 4) {
        catagories.add(data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasItemsInCart = context.watch<Cartprovider>().size() > 0;

    return Scaffold(
      backgroundColor: Color.fromARGB(222, 106, 133, 243),
      appBar: AppBar(
        title: const Center(
          child: Text("Shopping list"),
        ),
        backgroundColor: const Color.fromARGB(142, 33, 149, 243),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(bottom: hasItemsInCart ? bottomSheetHeight : 0),
        child: FutureBuilder(
          future: getCatagory(),
          builder: (context, snapshot) {
            //if getCatagorie done show  the catagories
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: catagories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              products(product_name: catagories[index]),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(4.w, 4.h),
                            blurRadius: 5,
                          )
                        ],
                        color: Color.fromARGB(255, 123, 141, 156),
                        borderRadius: BorderRadius.circular(15.h),
                      ),
                      margin: EdgeInsets.all(3.h),
                      height: 200.h,
                      width: double.infinity,
                      child: Center(
                        child: Text(catagories[index]),
                      ),
                    ),
                  );
                },
              );
            }
            //show loading screen
            else {
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
