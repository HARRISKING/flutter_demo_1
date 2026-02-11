// 导入Flutter的Material Design组件库
import 'package:flutter/material.dart';
// 导入详情页组件
import 'detail.dart';
// 导入我的页面组件
import 'my.dart';
// 导入首页组件
import 'home.dart';

// 索引页面组件，继承自StatefulWidget
class Index extends StatefulWidget {
  // 构造函数，接收key参数
  const Index({super.key});

  // 重写createState方法，创建状态管理对象
  @override
  State<Index> createState() => _IndexState();
}

// Index的状态管理类，继承自State
class _IndexState extends State<Index> {
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
  final List _lists = [MyApp(), Home(), Detail()];

  // 重写build方法，构建UI界面
  @override
  Widget build(BuildContext context) {
    // 返回Scaffold组件，提供应用程序的基本结构
    return Scaffold(
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        // 当前选中的索引
        currentIndex: _currentIndex,
        // 点击事件回调
        onTap: (index) {
          // 调用页面切换方法
          _changePage(index);
        },
        // 选中项的字体大小
        selectedFontSize: 16,
        // 未选中项的字体大小
        unselectedFontSize: 16,
        // 导航栏项
        items: const [
          // 首页导航项
          BottomNavigationBarItem(
            icon: Icon(Icons.multitrack_audio_sharp),
            label: '计数器',
          ),
          // 联系人导航项
          BottomNavigationBarItem(
            icon: Icon(Icons.interpreter_mode_sharp),
            label: '输入框',
          ),
          // 我的页面导航项
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: '任务列表',
          ),
        ],
      ),
      // 左侧抽屉菜单
      drawer: Drawer(
        // 抽屉内容
        child: ListView(
          // 内边距设为0
          padding: EdgeInsets.zero,
          // 列表项
          children: [
            // 抽屉头部
            DrawerHeader(
              // 头部装饰，设置背景色为粉色
              decoration: BoxDecoration(color: Colors.pink),
              // 头部文本
              child: Text(
                '抽屉菜单',
                // 文本样式
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            // 菜单项1
            ListTile(
              // 菜单项标题
              title: Text('选项1'),
              // 点击事件
              onTap: () {
                // 关闭抽屉
                Navigator.pop(context);
              },
            ),
            // 菜单项2
            ListTile(
              // 菜单项标题
              title: Text('选项2'),
              // 点击事件
              onTap: () {
                // 关闭抽屉
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // 应用栏
      appBar: AppBar(
        // 应用栏标题
        title: Text(
          'My Flutter App',
          // 标题样式
          style: TextStyle(
            // 文本颜色
            color: Colors.black,
            // 字体大小
            fontSize: 18,
            // 字体粗细
            fontWeight: FontWeight.bold,
          ),
        ),
        // 应用栏阴影
        elevation: 0,
      ),
      // 页面主体内容，根据当前索引显示对应的页面
      body: _lists[_currentIndex],
    );
  }
}
