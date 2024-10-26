import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/provider/cartprovider.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  cartitem(int index, BuildContext context) {
    return Container(
      height: 170.h,
      margin: EdgeInsets.all(7.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color: const Color.fromARGB(193, 30, 30, 30),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 218, 223, 227),
                  borderRadius: BorderRadius.circular(10)),
              height: 120.h,
              width: 120.w,
              child: Image.network(
                context.read<Cartprovider>().cart[index].image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Text(
            "Price: \$${context.read<Cartprovider>().cart[index].price}",
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: IconButton(
              color: const Color.fromARGB(180, 233, 239, 148),
              onPressed: () {},
              icon: const Icon(
                Icons.cancel,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            color: const Color.fromARGB(84, 255, 255, 255),
            child: ListView.builder(
              itemCount: context.read<Cartprovider>().size(),
              itemBuilder: (context, index) {
                return cartitem(index, context);
              },
            ),
          ),
        ),
        Wrap(
          children: [
            Text("Total:    "),
            Container(
              child: Text("\$1234"),
            )
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("Check out"),
        )
      ],
    );
  }
}
