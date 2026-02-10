import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String content;
  final bool status;
  Function(bool?)? onChanged;

  TodoItem({
    super.key,
    required this.content,
    required this.status,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0, bottom: 14),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Checkbox(value: status, onChanged: (value) => onChanged!(value)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Text(
                  content,
                  style: TextStyle(
                    decoration: status ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
