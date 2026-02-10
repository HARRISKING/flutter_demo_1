// 导入Flutter的Material Design组件库
import 'package:flutter/material.dart';

// 首页组件，继承自StatefulWidget
class Home extends StatefulWidget {
  // 构造函数，接收key参数
  Home({Key? key}) : super(key: key);

  // 重写createState方法，创建状态管理对象
  @override
  _HomeState createState() => _HomeState();
}

// Home的状态管理类，继承自State
class _HomeState extends State<Home> {
  // 计数变量，初始值为0
  int _count = 0;

  // 增加计数的方法
  void _increateCount() {
    // 调用setState更新状态，使用箭头函数简化语法
    setState(() => _count++);
  }

  // 重写build方法，构建UI界面
  @override
  Widget build(BuildContext context) {
    // 返回Scaffold组件，提供应用程序的基本结构
    return Scaffold(
      // 页面主体内容
      body: Center(
        // 居中显示
        child: Column(
          // 垂直居中对齐
          mainAxisAlignment: MainAxisAlignment.center,
          // 子组件列表
          children: [
            // 文本组件，显示当前计数
            Text(
              '当前计数: $_count',
              // 文本样式
              style: TextStyle(fontSize: 24, color: Colors.pink),
            ),
            // 空容器，用于在文本和按钮之间留出20像素的垂直间距
            SizedBox(height: 20),
            //  ElevatedButton组件，用于触发增加计数的操作
            ElevatedButton(
              // 点击事件回调，指向_increateCount方法
              onPressed: _increateCount,
              // 按钮文本
              child: Text(
                '增加',
                // 文本样式
                style: TextStyle(fontSize: 16, color: Colors.pink),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
