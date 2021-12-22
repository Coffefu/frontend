import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final String imgUrl;

  Product(this.id, this.name, this.imgUrl);
}

class ProductWidget extends StatelessWidget {
  late Product product;

  ProductWidget(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(27, 30, 27, 17),
          child: Image.network(product.imgUrl),
        ),
        Text(product.name)
      ]),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FB),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
              color: Color(0x4F000000), blurRadius: 4, offset: Offset(0, 4))
        ],
      ),
    );
  }
}
