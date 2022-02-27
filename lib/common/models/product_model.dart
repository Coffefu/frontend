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
  int count;

  CardProduct(
      {required String name,
      required String description,
      required int price,
      required this.count})
      : super(name: name, description: description, price: price);

  CardProduct.fromProduct({required Product product, required this.count})
      : super.clone(product: product);
}
