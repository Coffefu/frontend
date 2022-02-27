import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:frontend/common/components/counter_widget.dart';
import 'package:frontend/common/models/app_state.dart';
import 'package:frontend/common/models/product_model.dart';
import 'package:frontend/store/actions/cart_actions.dart';

class OrderActivity extends StatefulWidget {
  final Product product;

  const OrderActivity({Key? key, required this.product}) : super(key: key);

  @override
  _OrderActivityState createState() => _OrderActivityState();
}

class _OrderActivityState extends State<OrderActivity> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Заказ", style: TextStyle(fontSize: 28)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(fontSize: 32),
                  ),
                  CounterWidget(callBack: (value) => count = value),
                ],
              ),
            ),
            const Text("Размер", style: TextStyle(fontSize: 32)),
            const Text("Сахар", style: TextStyle(fontSize: 32)),
            const Text("100 руб", style: TextStyle(fontSize: 32)),
            StoreConnector<AppState, Function(CardProduct)>(
              converter: (store) =>
                  (item) => store.dispatch(AddItemAction(item)),
              builder: (context, callback) => ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 80),
                  ),
                ),
                onPressed: () {
                  callback(CardProduct.fromProduct(
                      product: widget.product, count: count));
                  Navigator.pop(context);
                },
                child: const Text('Добавить', style: TextStyle(fontSize: 24)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
