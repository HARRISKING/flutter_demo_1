import 'package:flutter/material.dart';
import 'detail.dart';
import 'my.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List _lists = [HomeContent(), Details(), MyApp()];

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
            icon: Icon(Icons.medical_information),
            label: '详情',
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
        backgroundColor: Colors.amber[900],
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
      ),
      body: _lists[_currentIndex],
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('首页内容'));
  }
}
