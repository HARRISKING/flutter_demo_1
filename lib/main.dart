import 'package:flutter/material.dart';
import 'package:flutter_demo_1/home.dart';
import 'package:flutter_demo_1/detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),

      routes: {'/home': (context) => Home(), '/detail': (context) => Details()},
    );
  }
}
