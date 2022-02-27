import 'dart:convert';

import 'package:frontend/common/models/app_state.dart';
import 'package:frontend/common/models/product_model.dart';
import 'package:frontend/store/actions/menu_actions.dart';
import "package:http/http.dart" as http;
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> getMenuProducts() {
  return (Store<AppState> store) async {
    var productsList = [];
    final response = await http.get(
      Uri.parse('http://51.250.37.59/products'),
      headers: {'Content-Type': 'application/json'},
    );

    productsList = List.from(jsonDecode(utf8.decode(response.bodyBytes)));
    var products = List<Product>.generate(
        productsList.length,
        (i) => Product(
            name: productsList[i]['name'],
            description: productsList[i]['description'] ?? "",
            price: 0));
    if (products.isNotEmpty) {
      store.dispatch(menuLoadingSuccessAction(products));
    } else {
      store.dispatch(menuLoadingFailureAction());
    }
  };
}
