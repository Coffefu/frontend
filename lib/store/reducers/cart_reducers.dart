import 'package:frontend/common/models/product_model.dart';
import 'package:frontend/store/actions/cart_actions.dart';

List<Product> cartReducers(List<Product> items, dynamic action) {
  if (action is AddItemAction) return addItem(items, action);
  if (action is RemoveItemAction) return removeItem(items, action);

  return items;
}

List<Product> addItem(List<Product> items, AddItemAction action) {
  return List.from(items)..add(action.item);
}

List<Product> removeItem(List<Product> items, RemoveItemAction action) {
  items.remove(action.item);
  return List.from(items);
}
