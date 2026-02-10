import 'package:flutter/material.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({super.key, required this.onAddTask});

  final Function(String) onAddTask;

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('添加任务'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: '请输入任务内容'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('取消'),
        ),
        TextButton(
          onPressed: () => {
            Navigator.of(context).pop(),
            widget.onAddTask(_controller.text),
          },
          child: Text('添加'),
        ),
      ],
    );
  }
}
