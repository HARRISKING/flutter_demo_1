import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count = 0;

  void _increateCount() {
    setState(() => _count++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '当前计数: $_count',
              style: TextStyle(fontSize: 24, color: Colors.pink),
            ),
            SizedBox(height: 20), // 用于在文本和按钮之间留出 20 像素的垂直间距
            ElevatedButton(
              onPressed: _increateCount,
              child: Text(
                '增加',
                style: TextStyle(fontSize: 16, color: Colors.pink),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
