import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:frontend/common/components/product_widget.dart';
import 'package:frontend/common/models/app_state.dart';
import 'package:frontend/common/models/product_model.dart';
import 'package:frontend/store/thunk/fetch_menu.dart';

class MenuActivity extends StatefulWidget {
  const MenuActivity({Key? key}) : super(key: key);

  @override
  State<MenuActivity> createState() => _MenuActivityState();
}

class _MenuActivityState extends State<MenuActivity> {
  int coffeeHouse = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          coffeeHouse.toString(),
          style: const TextStyle(fontSize: 24),
        ),
        actions: [],
      ),
      body: StoreConnector<AppState, List<Product>>(
          onInit: (store) => store.dispatch(getMenuProducts()),
          converter: (store) => store.state.menu.products,
          builder: (context, list) {
            var products = List<ProductWidget>.generate(
                list.length, (i) => ProductWidget(product: list[i]));
            return ListView(children: products);
          }),
    );
  }
}
