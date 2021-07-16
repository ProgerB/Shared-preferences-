import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(CoreApp());
}

class CoreApp extends StatelessWidget {
  const CoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoreApp',
      home: MyApp(),
    );
  }
}
