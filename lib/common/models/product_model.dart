import 'package:frontend/common/models/topping_model.dart';

class Product {
  final String name;
  final String description;
  final int price;

  Product({required this.name, required this.description, required this.price});

  Product.clone({required Product product})
      : name = product.name,
        description = product.description,
        price = product.price;
}

class CardProduct extends Product {
  List<Topping>? toppings;

  CardProduct({required Product product, this.toppings})
      : super.clone(product: product);
}
