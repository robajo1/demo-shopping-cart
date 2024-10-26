import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/productDetail.dart';
import 'package:shopping_cart/provider/cartprovider.dart';

class information_container extends StatelessWidget {
  Productdetail item;
  information_container({super.key, required Productdetail this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            color: const Color.fromARGB(193, 30, 30, 30),
          ),
          margin: EdgeInsets.all(7.h),
          height: 170.h,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 218, 223, 227),
                      borderRadius: BorderRadius.circular(10)),
                  height: 150,
                  width: 150,
                  child: Image.network(
                    item.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.w, left: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                        ),
                        item.category,
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Row(
                          children: [
                            Text(
                              "\$${item.price.toString()}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 255, 253, 253)),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                          Color.fromARGB(255, 13, 102, 236)),
                                ),
                                onPressed: () {
                                  Provider.of<Cartprovider>(context,
                                          listen: false)
                                      .add(item);
                                },
                                child: const Text("Buy"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
