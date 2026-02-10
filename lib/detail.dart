import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: Text('返回首页'),
        ),
      ),
    );
  }
}
