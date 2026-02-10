// 导入Flutter的Material Design组件库
import 'package:flutter/material.dart';

// TODO项组件，继承自StatelessWidget
class TodoItem extends StatelessWidget {
  // 任务内容
  final String content;
  // 任务状态（是否完成）
  final bool status;
  // 状态变更回调函数
  Function(bool?)? onChanged;
  // 删除任务回调函数
  Function()? onDelete;

  // 构造函数，接收必要的参数
  TodoItem({
    super.key,
    required this.content,
    required this.status,
    required this.onChanged,
    this.onDelete,
  });

  // 重写build方法，构建UI界面
  @override
  Widget build(BuildContext context) {
    // 返回Padding组件，设置底部边距
    return Padding(
      // 设置内边距，底部边距为14
      padding: EdgeInsets.only(left: 0, right: 0, bottom: 14),
      // 子组件为Dismissible，实现滑动删除功能
      child: Dismissible(
        // 唯一键，用于标识Dismissible
        key: UniqueKey(),
        // 滑动方向，从右到左
        direction: DismissDirection.endToStart,
        // 滑动结束回调
        onDismissed: (direction) {
          // 调用删除回调函数
          onDelete?.call();
        },
        // 滑动背景
        background: Container(
          // 背景装饰
          decoration: BoxDecoration(
            // 背景色为红色
            color: Colors.red,
            // 圆角半径为8
            borderRadius: BorderRadius.circular(8),
          ),
          // 内容右对齐
          alignment: Alignment.centerRight,
          // 右内边距为20
          padding: EdgeInsets.only(right: 20),
          // 子组件为删除图标
          child: Icon(Icons.delete, color: Colors.white),
        ),
        // 子组件为任务项容器
        child: Container(
          // 容器装饰
          decoration: BoxDecoration(
            // 背景色为浅灰色
            color: Colors.grey[200],
            // 圆角半径为8
            borderRadius: BorderRadius.circular(8),
          ),
          // 子组件为Row，水平排列
          child: Row(
            // 子组件列表
            children: [
              // 复选框，带内边距
              Padding(
                // 设置内边距
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                // 子组件为Checkbox
                child: Checkbox(
                  // 选中状态
                  value: status,
                  // 状态变更回调
                  onChanged: (value) => onChanged!(value),
                ),
              ),
              // 文本内容，使用Expanded占据剩余空间
              Expanded(
                // 子组件为Padding，设置内边距
                child: Padding(
                  // 设置内边距
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  // 子组件为Text
                  child: Text(
                    // 文本内容
                    content,
                    // 文本样式
                    style: TextStyle(
                      // 装饰线，完成状态下显示删除线
                      decoration: status ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
