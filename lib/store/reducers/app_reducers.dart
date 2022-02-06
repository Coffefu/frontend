import 'package:frontend/common/models/app_state.dart';
import 'package:frontend/store/reducers/cart_reducers.dart';
import 'package:frontend/store/reducers/menu_reducers.dart';

AppState appStateReducer(AppState state, action) => AppState(
    cartReducers(state.cartItems, action),
    menuReducers(state.menu.products, action)
);