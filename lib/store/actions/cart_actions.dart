import 'package:frontend/common/models/product_model.dart';

class AddItemAction {
  final CardProduct item;

  AddItemAction(this.item);
}

class RemoveItemAction {
  final CardProduct item;

  RemoveItemAction(this.item);
}
