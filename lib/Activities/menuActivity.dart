import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/components/product.dart';
import "package:http/http.dart" as http;

class MenuActivity extends StatefulWidget {
  const MenuActivity({Key? key}) : super(key: key);

  @override
  State<MenuActivity> createState() => _MenuActivityState();
}

class _MenuActivityState extends State<MenuActivity> {
  List<ProductWidget> products = [];

  // REDO fetchData()
  void fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://10.0.2.2:8000/products'));
      var data = jsonDecode(response.body) as List;
      var products = List<ProductWidget>.generate(data.length, (i) {
        var d = data[i];
        return ProductWidget(Product(d['id'], d['name'], d['img']));
      });
      setState(() {
        this.products = products;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return GridView.count(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      crossAxisCount: 2,
      crossAxisSpacing: 24,
      mainAxisSpacing: 20,
      children: products,
    );
  }
}
