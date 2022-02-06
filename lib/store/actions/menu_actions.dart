import 'package:frontend/common/models/product_model.dart';

class menuLoadingSuccessAction {
  final List<Product> products;

  menuLoadingSuccessAction(this.products);
}

class menuLoadingFailureAction {

  menuLoadingFailureAction();
}