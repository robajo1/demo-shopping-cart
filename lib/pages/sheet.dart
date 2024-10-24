import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sheet extends StatefulWidget {
  const Sheet({super.key});

  @override
  State<Sheet> createState() => _SheetState();
}

class _SheetState extends State<Sheet> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.w),
            topRight: Radius.circular(40.w),
          ),
          color: Colors.black87,
        ),
        padding: EdgeInsets.all(16.h),
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cart',
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
            ),
            Row(
              children: [
                const Text(
                  '1 Item', // This will show the number of items
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 10.w),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.shopping_cart, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
