import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List names = ['jack', 'mily', 'tom'];
    return Scaffold(
      backgroundColor: Colors.pink,
      bottomNavigationBar: BottomNavigationBar(
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
        title: Text('首页'),
        backgroundColor: Colors.amber[900],
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.skip_next, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/detail');
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (value, index) => ListTile(title: Text(names[index])),
          itemCount: names.length,
        ),
      ),
    );
  }
}
