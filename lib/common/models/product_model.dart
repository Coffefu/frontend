class Product {
  String name;
  String description;
  int price;

  Product({required this.name, required this.description, required this.price});
}

// TODO cardProduct implementation
class CardProduct extends Product {
  int count;

  CardProduct({required this.count, required Product product})
      : super(
            name: product.name,
            description: product.description,
            price: product.price);
}
