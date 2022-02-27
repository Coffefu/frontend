import 'package:frontend/common/models/menu.dart';
import 'package:frontend/common/models/product_model.dart';

class AppState {
  final List<CardProduct> cartItems;
  final Menu menu;

  AppState(this.cartItems, this.menu);
}