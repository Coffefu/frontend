import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:frontend/common/components/product_widget.dart';
import 'package:frontend/common/models/app_state.dart';
import 'package:frontend/common/models/product_model.dart';
import 'package:frontend/store/thunk/fetch_menu.dart';

class CartActivity extends StatefulWidget {
  const CartActivity({Key? key}) : super(key: key);

  @override
  State<CartActivity> createState() => _CartActivityState();
}

class _CartActivityState extends State<CartActivity> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Center(
            child: StoreConnector<AppState, List<Product>>(
                onInit: (store) => store.dispatch(getMenuProducts()),
                converter: (store) => store.state.cartItems,
                builder: (context, list) {
                  var products = List<ProductWidget>.generate(list.length,
                      (i) => ProductWidget(product: list[i]));
                  return products.isEmpty
                      ? const Text(
                          "В корзине пусто",
                          style: TextStyle(fontSize: 24),
                        )
                      : GridView.count(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          crossAxisCount: 1,
                          mainAxisSpacing: 20,
                          childAspectRatio: 5,
                          children: products,
                        );
                }),
          )),
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 5, horizontal: 80),
              ),
            ),
            onPressed: () {},
            child: const Text('Заказать', style: TextStyle(fontSize: 24)),
          )
        ],
      ),
    );
  }
}
