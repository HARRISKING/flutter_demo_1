import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List names = ['jack', 'mily', 'tom'];
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text('首页'),
        backgroundColor: Colors.amber[900],
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            print('左侧按钮被点击了');
          },
          icon: Icon(Icons.menu, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.skip_next, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/detail');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (value, index) => ListTile(title: Text(names[index])),
        itemCount: names.length,
      ),
    );
  }
}
