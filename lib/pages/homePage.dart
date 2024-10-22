import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List catagories = [];
  Future getCatagory() async {
    var response =
        await http.get(Uri.https('fakestoreapi.com', 'products/categories'));
    var jasondata = jsonDecode(response.body);
    for (var data in jasondata) {
      if (catagories.length < 4) {
        catagories.add(data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.shopping_cart,
            color: Color.fromARGB(255, 0, 0, 0),
          )
        ],
        title: const Center(
          child: Text("Shopping list"),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: getCatagory(),
        builder: (context, snapshot) {
          //if done show  the catagories
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: catagories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  //when tapped go to other screen
                  onTap: () {},
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: Text(catagories[index]),
                    ),
                  ),
                );
              },
            );
          }
          //show loading screen
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
