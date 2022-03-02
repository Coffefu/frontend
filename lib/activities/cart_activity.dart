import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:frontend/common/components/product_widget.dart';
import 'package:frontend/common/models/app_state.dart';
import 'package:frontend/common/models/product_model.dart';
import 'package:frontend/common/components/button.dart';

class CartActivity extends StatefulWidget {
  const CartActivity({Key? key}) : super(key: key);

  @override
  State<CartActivity> createState() => _CartActivityState();
}

class _CartActivityState extends State<CartActivity> {
  @override
  Widget build(BuildContext context) {
    const cardEmpty = "В корзине пусто";

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: StoreConnector<AppState, List<Product>>(
          converter: (store) => store.state.cartItems,
          builder: (context, list) {
            var products = List<ProductWidget>.generate(
                list.length, (i) => ProductWidget(product: list[i]));
            return products.isEmpty
                ? const Center(
                    child: Text(cardEmpty, style: TextStyle(fontSize: 24)))
                : Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Expanded(child: ListView(children: products)),
                    Button(
                        onTap: () {},
                        child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 92),
                            child: Text('Добавить')))
                  ]);
          }),
    );
  }
}
