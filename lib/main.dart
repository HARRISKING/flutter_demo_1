// 导入Flutter的Material Design组件库
import 'package:flutter/material.dart';
// 导入首页组件
import 'package:flutter_demo_1/pages/home.dart';
// 导入详情页组件
import 'package:flutter_demo_1/pages/detail.dart';
// 导入我的页面组件
import 'package:flutter_demo_1/pages/my.dart';
// 导入索引页面组件
import 'package:flutter_demo_1/pages/index.dart';

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
  // 当前选中的页面索引
  int _currentIndex = 0;

  // 页面切换方法，接收索引参数
  void _changePage(int index) {
    // 调用setState更新状态
    setState(() {
      // 更新当前索引
      _currentIndex = index;
    });
  }

  // 页面列表，包含首页、详情页和我的页面
  final List _lists = [Home(), Detail(), MyApp()];

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
      routes: {'/home': (context) => Home(), '/detail': (context) => Detail()},
    );
  }
}
