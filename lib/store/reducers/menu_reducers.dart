import 'package:frontend/common/models/menu.dart';
import 'package:frontend/common/models/product_model.dart';
import 'package:frontend/store/actions/menu_actions.dart';

Menu menuReducers(List<Product> products, dynamic action) {
  if (action is menuLoadingSuccessAction) {
    return menuLoadingSuccess(products, action);
  }
  if (action is menuLoadingFailureAction) {
    return menuLoadingFailure(action);
  }

  return Menu(products);
}

Menu menuLoadingSuccess(
    List<Product> products, menuLoadingSuccessAction action) {
  return Menu(List.from(action.products));
}

Menu menuLoadingFailure(menuLoadingFailureAction action) {
  return Menu([]);
}
