
import 'package:frontend/common/models/product_model.dart';

class AddItemAction {
  final Product item;

  AddItemAction(this.item);
}

class DeleteItemAction {
  final Product item;

  DeleteItemAction(this.item);
}