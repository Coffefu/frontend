import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final String imgUrl;

  Product(this.id, this.name, this.imgUrl);
}

class ProductWidget extends StatefulWidget {
  late Product product;

  ProductWidget(this.product, {Key? key}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: const Color(0xFFF7F8FB),
        elevation: 8,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => {}, //TODO implement Product click method
            child: Container(
              padding: const EdgeInsets.all(0.0),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(27, 30, 27, 17),
                  child: Image.network(widget.product.imgUrl),
                ),
                Text(widget.product.name)
              ]),
            )));
  }
}
