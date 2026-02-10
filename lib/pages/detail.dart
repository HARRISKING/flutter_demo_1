import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController _controller = TextEditingController();
  String _contactName = '';

  void _changeContactName() {
    setState(() => _contactName = _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('联系人：' + _contactName, style: TextStyle(fontSize: 16)),
              SizedBox(height: 20), // 用于在文本和按钮之间留出 20 像素的垂直间距
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: '联系人',
                  hintText: '请输入联系人姓名',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20), // 用于在文本和按钮之间留出 20 像素的垂直间距
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _changeContactName,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // 背景色
                    foregroundColor: Colors.white, // 文字颜色
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                  ),
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
