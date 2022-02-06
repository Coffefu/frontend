import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:frontend/common/components/product.dart';
import 'package:frontend/common/models/app_state.dart';
import 'package:frontend/common/models/product_model.dart';
import 'package:frontend/store/thunk/fetch_menu.dart';

class MenuActivity extends StatefulWidget {
  const MenuActivity({Key? key}) : super(key: key);

  @override
  State<MenuActivity> createState() => _MenuActivityState();
}

class _MenuActivityState extends State<MenuActivity> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Product>>(
        onInit: (store) {
          store.dispatch(getMenuProducts());
        },
        converter: (store) => store.state.menu.products,
        builder: (context, list) {
          var products =
              List<ProductWidget>.generate(list.length, (i) {
            var d = list[i];
            return ProductWidget(ProductCard(i, d.name));
          });
          return GridView.count(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            crossAxisCount: 2,
            crossAxisSpacing: 24,
            mainAxisSpacing: 20,
            children: products,
          );
        });
  }
}
