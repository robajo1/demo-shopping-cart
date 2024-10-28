import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_cart/model/productDetail.dart';

class Itemdetailsheet extends StatelessWidget {
  Productdetail item;
  Itemdetailsheet({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 134, 156, 167),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.w),
          topRight: Radius.circular(20.w),
        ),
      ),
      height: 600.h,
      child: Stack(
        //to show text on top of the image
        children: [
          Opacity(
            opacity: 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.w),
                topRight: Radius.circular(20.w),
              ),
              child: Image.network(
                item.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.h),
            child: Column(
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color.fromRGBO(18, 69, 235, 1),
                  ),
                ),
                Text(
                  item.description,
                  style: TextStyle(fontSize: 20.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
