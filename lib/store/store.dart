import 'dart:convert';

import "package:http/http.dart" as http;

late List<dynamic> productsList = List.empty();

Future<List<dynamic>> fetchProducts() async {
  try {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/products'));
    productsList = List.from(jsonDecode(response.body) as List);
  } catch (error) {
    print("Error: $error");
  }

  return productsList;
}
