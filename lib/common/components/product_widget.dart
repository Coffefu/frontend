import 'package:flutter/material.dart';
import 'package:frontend/common/models/product_model.dart';

class ProductWidget extends StatefulWidget {
  final Product product;

  const ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        constraints: const BoxConstraints(minHeight: 100),
        child: Material(
          color: const Color(0x99996633),
          borderRadius: borderRadius,
          child: InkWell(
            splashColor: const Color(0xFF5C3D1F),
            highlightColor: const Color(0x445C3D1F),
            borderRadius: borderRadius,
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${widget.product.price} ₽",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          widget.product.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      const Icon(Icons.arrow_forward)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
