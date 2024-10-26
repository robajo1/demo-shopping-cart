import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/home.dart';
import 'package:shopping_cart/provider/cartprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cartprovider(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(411, 915), // Pixel 6 design size
        minTextAdapt: true,
        builder: (context, child) {
          return const MaterialApp(
            home: Homepage(),
          );
        },
      ),
    );
  }
}
