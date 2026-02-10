import 'package:flutter/material.dart';
import 'package:flutter_demo_1/home.dart';
import 'package:flutter_demo_1/detail.dart';
import 'package:flutter_demo_1/my.dart';
import 'package:flutter_demo_1/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List _lists = [Home(), Details(), MyApp()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Index(),
      routes: {'/home': (context) => Home(), '/detail': (context) => Details()},
    );
  }
}
