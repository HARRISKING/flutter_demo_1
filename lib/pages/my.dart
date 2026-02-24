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
  late Offset _buttonPosition;
  late double _screenWidth;

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

  void initState() {
    super.initState();
    _buttonPosition = Offset(0, 0);
  }

  void _updatePosition(DraggableDetails details) {
    // 获取拖拽结束的 x 坐标
    double newX = details.offset.dx;
    // 获取拖拽结束的 y 坐标
    double newY = details.offset.dy;
    newX = newX.clamp(0, _screenWidth + 56);
    newY = newY.clamp(168, MediaQuery.of(context).size.height - 300);

    setState(() {
      _buttonPosition = Offset(newX, newY);
    });
    if (newX < _screenWidth / 2) {
      _buttonPosition = Offset(28, newY);
    } else {
      _buttonPosition = Offset(_screenWidth - 56, newY);
    }
  }

  // 重写build方法，构建UI界面
  @override
  Widget build(BuildContext context) {
    // 获取屏幕高度
    double _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;

    // 首次构建时设置默认位置为右下角
    if (_buttonPosition == Offset(0, 0)) {
      // 计算右下角位置，留适当边距
      _buttonPosition = Offset(_screenWidth - 56, _screenHeight - 500);
    }
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
      floatingActionButton: Stack(
        children: [
          Positioned(
            left: _buttonPosition.dx,
            top: _buttonPosition.dy,
            child: Draggable(
              feedback: FloatingActionButton(
                // 反馈组件不可点击
                onPressed: null,
                // 提示文本
                tooltip: 'Increment',
                // 显示加号图标
                child: const Icon(Icons.add),
              ),
              onDragEnd: _updatePosition,
              childWhenDragging: Container(),
              child: FloatingActionButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AddDialog(onAddTask: addTask),
                ),
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
