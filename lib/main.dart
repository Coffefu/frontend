import 'package:flutter/material.dart';
import 'package:frontend/Activities/load_activity.dart';

import 'bottom_navigation.dart';
import 'store/store.dart' as store;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    setState(() => _isLoading = true);

    await store.fetchProducts();

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _isLoading ? const LoadActivity() : const BottomNavigationWidget(),
    );
  }
}
