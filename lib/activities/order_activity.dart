import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:frontend/common/components/button.dart';
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
  int get cost {
    return 123;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name, style: const TextStyle(fontSize: 28)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {},
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Добавки", style: TextStyle(fontSize: 22)),
                            Icon(Icons.arrow_forward),
                          ],
                        )))
              ],
            ),
            Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Итоговая сумма",
                          style: TextStyle(fontSize: 24)),
                      Text("$cost ₽", style: const TextStyle(fontSize: 24))
                    ]),
                const SizedBox(height: 10),
                StoreConnector<AppState, Function(CardProduct)>(
                    converter: (store) =>
                        (item) => store.dispatch(AddItemAction(item)),
                    builder: (context, callback) => Button(
                        onTap: () {
                          callback(CardProduct(product: widget.product));
                          Navigator.pop(context);
                        },
                        child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 92),
                            child: Text('Добавить')))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
