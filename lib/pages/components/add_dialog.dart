// 导入Flutter的Material Design组件库
import 'package:flutter/material.dart';

// 添加任务对话框组件，继承自StatefulWidget
class AddDialog extends StatefulWidget {
  // 构造函数，接收key和onAddTask回调函数参数
  const AddDialog({super.key, required this.onAddTask});

  // 回调函数，用于添加任务
  final Function(String) onAddTask;

  // 重写createState方法，创建状态管理对象
  @override
  State<AddDialog> createState() => _AddDialogState();
}

// AddDialog的状态管理类，继承自State
class _AddDialogState extends State<AddDialog> {
  // 文本编辑控制器，用于控制输入框的内容
  TextEditingController _controller = TextEditingController();

  // 重写build方法，构建UI界面
  @override
  Widget build(BuildContext context) {
    // 返回AlertDialog组件，显示对话框
    return AlertDialog(
      // 对话框标题
      title: Text('添加任务'),
      // 对话框内容
      content: TextField(
        // 关联文本编辑控制器
        controller: _controller,
        // 输入框装饰
        decoration: InputDecoration(hintText: '请输入任务内容'),
      ),
      // 对话框操作按钮
      actions: [
        // 取消按钮
        TextButton(
          // 点击事件回调，关闭对话框
          onPressed: () => Navigator.of(context).pop(),
          // 按钮文本
          child: Text('取消'),
        ),
        // 添加按钮
        TextButton(
          // 点击事件回调，使用箭头函数和大括号执行多个操作
          onPressed: () => {
            // 关闭对话框
            Navigator.of(context).pop(),
            // 调用onAddTask回调函数，传递输入框的文本
            widget.onAddTask(_controller.text),
          },
          // 按钮文本
          child: Text('添加'),
        ),
      ],
    );
  }
}
