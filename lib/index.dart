import 'package:flutter/material.dart';
import 'package:flutter_demo_1/home.dart';
import 'package:flutter_demo_1/detail.dart';
import 'package:flutter_demo_1/my.dart';

class Index extends StatefulWidget {
  const Index({super.key});
  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List _pages = [Home(), Details(), MyApp()];
    return Scaffold(body: _pages[_currentIndex]);
  }
}
