// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart/model/productDetail.dart';
import 'package:shopping_cart/pages/container_info.dart/information_container.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String selectedCategory = ""; // Holds the currently selected category
  String catagory = "";
  List products = [];
  Future getProduct() async {
    var response =
        await http.get(Uri.https('fakestoreapi.com', 'products$catagory'));
    var jsondata = jsonDecode(response.body);

    for (var data in jsondata) {
      products.add(
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

  var textButtonColor =
      WidgetStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 0));

  var ButtonColor =
      WidgetStateProperty.all<Color>(const Color.fromARGB(255, 255, 253, 253));
  var selectedcolor =
      WidgetStateProperty.all<Color>(const Color.fromARGB(193, 30, 30, 30));

  var selectedtxtcolor =
      WidgetStateProperty.all<Color>(const Color.fromARGB(255, 255, 253, 253));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: RichText(
              text: TextSpan(
                text: "Best Store",
                style: TextStyle(
                  color: const Color.fromARGB(193, 30, 30, 30),
                  fontWeight: FontWeight.bold,
                  fontSize: 40.sp,
                ),
                children: [
                  TextSpan(
                    text: "\n Your Best Choice",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: Wrap(
              spacing: 10.w,
              children: [
                _buildCategoryButton("All", ""),
                _buildCategoryButton("Electronics", "/category/electronics"),
                _buildCategoryButton("Jewelry", "/category/jewelery"),
                _buildCategoryButton(
                    "Men's Clothing", "/category/men's clothing"),
                _buildCategoryButton(
                    "Women's Clothing", "/category/women's clothing"),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: FutureBuilder(
                future: getProduct(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return information_container(item: products[index]);
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
          )
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String label, String category) {
    bool isSelected = selectedCategory == category;

    return TextButton(
      style: ButtonStyle(
        backgroundColor: isSelected ? selectedcolor : ButtonColor,
        foregroundColor: isSelected ? selectedtxtcolor : textButtonColor,
      ),
      onPressed: () {
        setState(() {
          selectedCategory = category;
          products.clear();
          catagory = category;
        });
      },
      child: Text(label),
    );
  }
}
