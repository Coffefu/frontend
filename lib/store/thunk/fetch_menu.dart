import 'package:frontend/common/components/product.dart';
import 'package:frontend/common/models/app_state.dart';
import 'package:frontend/common/models/product_model.dart';
import 'package:frontend/store/actions/menu_actions.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'dart:convert';
import "package:http/http.dart" as http;

ThunkAction<AppState> getMenuProducts() {
  return (Store<AppState> store) async {
    var productsList = [];
    final response = await http.get(
          Uri.parse('http://51.250.4.2/products'),
          headers: {'Content-Type': 'application/json'});

    productsList =
          List.from(jsonDecode(utf8.decode(response.bodyBytes)));
    var products = <Product>[];
    for (var i = 0; i < productsList.length; i++) {
      products.add(Product(productsList[i]['name'], ''));
    }
    if (products.isNotEmpty) {
      store.dispatch(menuLoadingSuccessAction(products));
    } else {
      store.dispatch(menuLoadingFailureAction());
    }
  };
}