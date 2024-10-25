import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/provider/cartprovider.dart';

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
        color: const Color.fromARGB(135, 97, 96, 96),
        padding: EdgeInsets.all(16.h),
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cart',
              style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  '${context.watch<Cartprovider>().size()} Item', // This will show the number of items
                  style: const TextStyle(
                    color: Color.fromARGB(255, 2, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
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
