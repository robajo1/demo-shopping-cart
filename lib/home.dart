import 'package:flutter/material.dart';
import 'package:shopping_cart/pages/cartPage.dart';
import 'package:shopping_cart/pages/homePage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List catagories = [];
  // final double bottomSheetHeight = 80.h;
  // Future getCatagory() async {
  //   var response =
  //       await http.get(Uri.https('fakestoreapi.com', 'products/categories'));
  //   var jasondata = jsonDecode(response.body);
  //   for (var data in jasondata) {
  //     if (catagories.length < 4) {
  //       catagories.add(data);
  //     }
  //   }
  // }

  int _selectedindex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  List<Widget> page = [
    const home(),
    Cartpage(),
    const Center(
      child: Text("About us"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //bool hasItemsInCart = context.watch<Cartprovider>().size() > 0;

    return Scaffold(
      backgroundColor: Color.fromARGB(230, 255, 255, 255),
      body: page[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedindex,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "products"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_rounded), label: "About us"),
        ],
      ),
    );
  }
}
// Padding(
//         padding:
//             EdgeInsets.only(bottom: hasItemsInCart ? bottomSheetHeight : 0),
//         child: FutureBuilder(
//           future: getCatagory(),
//           builder: (context, snapshot) {
//             //if getCatagorie done show  the catagories
//             if (snapshot.connectionState == ConnectionState.done) {
//               return ListView.builder(
//                 itemCount: catagories.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               products(product_name: catagories[index]),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black,
//                             offset: Offset(4.w, 4.h),
//                             blurRadius: 5,
//                           )
//                         ],
//                         color: const Color.fromARGB(255, 123, 141, 156),
//                         borderRadius: BorderRadius.circular(15.h),
//                       ),
//                       margin: EdgeInsets.all(3.h),
//                       height: 200.h,
//                       width: double.infinity,
//                       child: Center(
//                         child: Text(catagories[index]),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//             //show loading screen
//             else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//       ),
//       bottomSheet: hasItemsInCart
//           ? SizedBox(height: bottomSheetHeight, child: const Sheet())
//           : null,