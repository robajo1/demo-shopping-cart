// ignore_for_file: file_names

import 'package:flutter/material.dart';
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
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: IconButton(
              color: const Color.fromARGB(180, 233, 239, 148),
              onPressed: () {
                setState(() {
                  Provider.of<Cartprovider>(context, listen: false)
                      .remove(context.read<Cartprovider>().cart[index]);
                });
              },
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
    if (context.read<Cartprovider>().size() == 0) {
      return Center(
        child: Text(
          "Cart Is Empty !!",
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.read<Cartprovider>().size(),
              itemBuilder: (context, index) {
                return cartitem(index, context);
              },
            ),
          ),
          Wrap(
            children: [
              Text(
                "Total: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              Text(
                "\$${totalprice().toString()}",
                style: TextStyle(
                  color: const Color.fromARGB(255, 211, 53, 53),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              )
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  const WidgetStatePropertyAll(Color.fromARGB(255, 87, 83, 68)),
              foregroundColor: const WidgetStatePropertyAll(
                  Color.fromARGB(255, 255, 255, 255)),
              elevation: WidgetStateProperty.all(20.h),
            ),
            onPressed: () {},
            child: const Text("Check out"),
          )
        ],
      );
    }
  }

  double totalprice() {
    double total = 0.0;
    for (int i = 0; i < context.read<Cartprovider>().size(); i++) {
      total += context.read<Cartprovider>().cart[i].price;
    }
    return total;
  }
}
