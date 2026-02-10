// 导入Flutter的Material Design组件库
import 'package:flutter/material.dart';
// 导入TODO项组件
import 'package:flutter_demo_1/pages/components/todo_item.dart';
// 导入添加任务对话框组件
import 'package:flutter_demo_1/pages/components/add_dialog.dart';

// 我的页面组件，继承自StatefulWidget
class MyApp extends StatefulWidget {
  // 构造函数，接收key参数
  const MyApp({super.key});

  // 重写createState方法，创建状态管理对象
  @override
  State<MyApp> createState() => _MyAppState();
}

// MyApp的状态管理类，继承自State
class _MyAppState extends State<MyApp> {
  // TODO任务列表，初始包含一个任务
  List _todoItems = [
    ['今日任务', false], // [任务内容, 完成状态]
  ];

  // 改变任务状态的方法，接收任务索引
  void changeStatus(int index) {
    // 调用setState更新状态
    setState(() {
      // 切换任务的完成状态
      _todoItems[index][1] = !_todoItems[index][1];
    });
  }

  // 添加新任务的方法，接收任务内容
  void addTask(String task) {
    // 调用setState更新状态
    setState(() {
      // 向任务列表中添加新任务，初始状态为未完成
      _todoItems.add([task, false]);
    });
  }

  // 重写build方法，构建UI界面
  @override
  Widget build(BuildContext context) {
    // 返回Scaffold组件，提供应用程序的基本结构
    return Scaffold(
      // 页面主体内容
      body: Padding(
        // 设置内边距为14
        padding: EdgeInsets.all(14),
        // 子组件为ListView.builder，用于构建动态列表
        child: ListView.builder(
          // 列表项数量，等于任务列表长度
          itemCount: _todoItems.length,
          // 列表项构建器，接收上下文和索引
          itemBuilder: (context, index) => TodoItem(
            // 任务内容
            content: _todoItems[index][0],
            // 任务状态
            status: _todoItems[index][1],
            // 状态变更回调，调用changeStatus方法
            onChanged: (value) => changeStatus(index),
          ),
        ),
      ),
      // 悬浮操作按钮
      floatingActionButton: FloatingActionButton(
        // 点击事件回调，显示添加任务对话框
        onPressed: () => showDialog(
          // 上下文
          context: context,
          // 对话框构建器，返回AddDialog组件
          builder: (context) => AddDialog(onAddTask: addTask),
        ),
        // 按钮图标
        child: Icon(Icons.add),
      ),
    );
  }
}
