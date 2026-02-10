import 'package:flutter/material.dart';
import 'detail.dart';
import 'my.dart';
import 'home.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentIndex = 0;

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List _lists = [Home(), Detail(), MyApp()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _changePage(index);
        },
        selectedFontSize: 16,
        unselectedFontSize: 16,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(
            icon: Icon(Icons.contactless_rounded),
            label: '联系人',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我'),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink), // 设置抽屉头部背景为粉色
              child: Text(
                // 抽屉头部显示的文本
                '抽屉菜单',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('选项1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('选项2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          '欢迎来到我的第一个flutter项目',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: _lists[_currentIndex],
    );
  }
}
