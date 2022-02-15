import 'package:frontend/common/models/product_model.dart';

class AddItemAction {
  final Product item;

  AddItemAction(this.item);
}

class RemoveItemAction {
  final Product item;

  RemoveItemAction(this.item);
}
