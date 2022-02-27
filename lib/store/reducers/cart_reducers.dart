import 'package:frontend/common/models/product_model.dart';
import 'package:frontend/store/actions/cart_actions.dart';

List<CardProduct> cartReducers(List<CardProduct> items, dynamic action) {
  if (action is AddItemAction) return addItem(items, action);
  if (action is RemoveItemAction) return removeItem(items, action);

  return items;
}

List<CardProduct> addItem(List<CardProduct> items, AddItemAction action) {
  return List.from(items)..add(action.item);
}

List<CardProduct> removeItem(List<CardProduct> items, RemoveItemAction action) {
  items.remove(action.item);
  return List.from(items);
}
