import 'dart:convert';

import "package:http/http.dart" as http;

late List<dynamic> productsList = List.empty();

Future<List<dynamic>> fetchProducts() async {
  try {
    final response = await http.get(
        Uri.parse('http://51.250.4.2:8000/products'),
        headers: {'Content-Type': 'application/json'});

    productsList =
        List.from(jsonDecode(utf8.decode(response.bodyBytes)) as List);
  } catch (error) {
    print("Error: $error");
  }

  return productsList;
}
