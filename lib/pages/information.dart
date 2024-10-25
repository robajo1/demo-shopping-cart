// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/productDetail.dart';
import 'package:shopping_cart/provider/cartprovider.dart';

class Information extends StatelessWidget {
  Productdetail item;
  Information({super.key, required this.item});
  Widget insidecontainer(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.network(
            fit: BoxFit.contain,
            item.image,
          ),
        ),
        Text(
          item.title,
          style: TextStyle(fontSize: 13.sp),
        ),
        Text(
          "Price : ${item.price.toString()} \$",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
          ),
        ),
        TextButton(
          onPressed: () {
            Provider.of<Cartprovider>(context, listen: false).add(item);
          }, //should be connected to a provider class
          child: const Text(
            'Buy',
            style: TextStyle(
                color: Color.fromARGB(255, 30, 0, 255),
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(75, 220, 215, 199),
          borderRadius: BorderRadius.circular(15.h),
        ),
        margin: EdgeInsets.all(10.h),
        child: insidecontainer(context),
      ),
    );
  }
}
