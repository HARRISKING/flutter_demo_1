// 导入Flutter的Material Design组件库
import 'package:flutter/material.dart';

// 详情页组件，继承自StatefulWidget
class Detail extends StatefulWidget {
  // 构造函数，接收key参数
  const Detail({super.key});

  // 重写createState方法，创建状态管理对象
  @override
  State<Detail> createState() => _DetailState();
}

// Detail的状态管理类，继承自State
class _DetailState extends State<Detail> {
  // 文本编辑控制器，用于控制输入框的内容
  TextEditingController _controller = TextEditingController();
  // 联系人姓名变量，初始值为空字符串
  String _contactName = '';

  // 更新联系人姓名的方法
  void _changeContactName() {
    // 调用setState更新状态，将输入框的文本赋值给_contactName
    setState(() => _contactName = _controller.text);
  }

  // 重写build方法，构建UI界面
  @override
  Widget build(BuildContext context) {
    // 返回Scaffold组件，提供应用程序的基本结构
    return Scaffold(
      // 页面主体内容
      body: Center(
        // 居中显示
        child: Padding(
          // 设置内边距为20
          padding: EdgeInsets.all(20),
          // 子组件
          child: Column(
            // 垂直居中对齐
            mainAxisAlignment: MainAxisAlignment.center,
            // 子组件列表
            children: [
              // 文本组件，显示联系人姓名
              Text('联系人：' + _contactName, style: TextStyle(fontSize: 16)),
              // 空容器，用于在文本和输入框之间留出20像素的垂直间距
              SizedBox(height: 20),
              // 文本输入框组件
              TextFormField(
                // 关联文本编辑控制器
                controller: _controller,
                // 输入框装饰
                decoration: InputDecoration(
                  // 标签文本
                  labelText: '联系人',
                  // 提示文本
                  hintText: '请输入联系人姓名',
                  // 边框样式
                  border: OutlineInputBorder(),
                ),
              ),
              // 空容器，用于在输入框和按钮之间留出20像素的垂直间距
              SizedBox(height: 20),
              // 空容器，用于设置按钮的宽度为全屏
              SizedBox(
                // 宽度设为无穷大，即充满父容器
                width: double.infinity,
                // 子组件为ElevatedButton
                child: ElevatedButton(
                  // 点击事件回调，指向_changeContactName方法
                  onPressed: _changeContactName,
                  // 按钮样式
                  style: ElevatedButton.styleFrom(
                    // 背景色
                    backgroundColor: Colors.blueAccent,
                    // 文字颜色
                    foregroundColor: Colors.white,
                    // 内边距
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    // 按钮形状
                    shape: RoundedRectangleBorder(
                      // 圆角半径
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // 阴影高度
                    elevation: 4,
                  ),
                  // 按钮文本
                  child: Text('确认'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
