import 'package:flutter/material.dart';
import 'package:frontend/common/models/product_model.dart';

class OrderActivity extends StatefulWidget {
  final Product product;

  const OrderActivity(this.product, {Key? key}) : super(key: key);

  @override
  _OrderActivityState createState() => _OrderActivityState();
}

class _OrderActivityState extends State<OrderActivity> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
