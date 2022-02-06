import 'package:frontend/common/models/product_model.dart';
import 'package:frontend/store/actions/cart_actions.dart';

List<Product> cartReducers(List<Product> items, dynamic action) {
  switch(action) {
    case AddItemAction:
      return addItem(items, action);
    case DeleteItemAction:
      return deleteItem(items, action);
  }

  return items;
}

List<Product> addItem(List<Product> items, AddItemAction action) {
  return List.from(items)..add(action.item);
}

List<Product> deleteItem(List<Product> items, AddItemAction action) {
  items.remove(action.item);
  return List.from(items);
}