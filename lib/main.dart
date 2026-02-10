// 导入Flutter的Material Design组件库
import 'package:flutter/material.dart';
// 导入索引页面组件
import 'package:flutter_demo_1/pages/index.dart';
// 导入详情页组件
import 'package:flutter_demo_1/pages/detail.dart';
// 导入我的页面组件
import 'package:flutter_demo_1/pages/my.dart';
// 导入首页组件
import 'package:flutter_demo_1/pages/home.dart';

// 应用程序的入口点
void main() {
  // 运行应用程序，启动MyApp组件
  runApp(MyApp());
}

// 应用程序的根组件，继承自StatefulWidget
class MyApp extends StatefulWidget {
  // 构造函数，接收key参数
  const MyApp({super.key});

  // 重写createState方法，创建状态管理对象
  @override
  State<MyApp> createState() => _MyAppState();
}

// MyApp的状态管理类，继承自State
class _MyAppState extends State<MyApp> {
  // 重写build方法，构建UI界面
  @override
  Widget build(BuildContext context) {
    // 返回MaterialApp组件，提供应用程序的核心功能
    return MaterialApp(
      // 隐藏调试模式横幅
      debugShowCheckedModeBanner: false,
      // 设置首页为Index组件
      home: Index(),
      // 定义路由表，用于导航
      routes: {
        '/index': (context) => Index(),
        '/detail': (context) => Detail(),
        '/my': (context) => MyApp(),
        '/home': (context) => Home(),
      },
    );
  }
}
