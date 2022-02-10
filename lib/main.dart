import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:frontend/activities/load_activity.dart';
import 'package:frontend/activities/order_activity.dart';
import 'package:frontend/common/components/product.dart';
import 'package:frontend/common/models/app_state.dart';
import 'package:frontend/store/reducers/app_reducers.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'common/models/menu.dart';
import 'navigation.dart';

void main() {
  final store = Store<AppState>(
    appStateReducer,
    initialState: AppState([], Menu([])),
    middleware: [thunkMiddleware],
  );

  runApp(CoffeeApp(store: store));
}

class CoffeeApp extends StatelessWidget {
  final Store<AppState> store;

  const CoffeeApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (BuildContext context) => const NavigationWidget(),
            '/loadScree': (BuildContext context) => const LoadActivity(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == '/orderActivity') {
              return MaterialPageRoute(builder: (context) {
                return OrderActivity(
                    product: settings.arguments as ProductCard);
              });
            }

            assert(false, 'Need to implement ${settings.name}');
            return null;
          },
        ));
  }
}
