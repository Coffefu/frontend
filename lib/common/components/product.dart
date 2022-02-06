import 'package:flutter/material.dart';

class ProductCard {
  final int id;
  final String name;

  ProductCard(this.id, this.name);
}

class ProductWidget extends StatefulWidget {
  final ProductCard product;

  const ProductWidget(this.product, {Key? key}) : super(key: key);

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
                const Padding(
                  padding: EdgeInsets.fromLTRB(27, 30, 27, 17)
                ),
                Text(widget.product.name)
              ]),
            )));
  }
}
