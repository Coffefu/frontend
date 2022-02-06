import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
        child: const MaterialApp(
          home: NavigationWidget()
        ));
  }
}
