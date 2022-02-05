import 'package:flutter/material.dart';
import 'package:frontend/common/components/product.dart';
import 'package:frontend/store/store.dart' as store;

class MenuActivity extends StatefulWidget {
  const MenuActivity({Key? key}) : super(key: key);

  @override
  State<MenuActivity> createState() => _MenuActivityState();
}

class _MenuActivityState extends State<MenuActivity> {
  @override
  Widget build(BuildContext context) {
    var products = List<ProductWidget>.generate(store.productsList.length, (i) {
      var d = store.productsList[i];
      return ProductWidget(Product(d['id'], d['name'], d['img']));
    });

    return GridView.count(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      crossAxisCount: 2,
      crossAxisSpacing: 24,
      mainAxisSpacing: 20,
      children: products,
    );
  }
}
