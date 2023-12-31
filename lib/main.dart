import 'package:crud_app/screens/productCreateScreen.dart';
import 'package:crud_app/screens/productGridViewScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductGridViewScreen(),//ProductCreateScreen(),
    );
  }
}
