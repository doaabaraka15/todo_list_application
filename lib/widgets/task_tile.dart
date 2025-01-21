import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  late bool isChecked;

  late String taskName;

  late Function(bool?) onChange;

  late Function() delete;

  TaskTile(
      {super.key,
      required this.taskName,
      required this.onChange,
      required this.delete,
      required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(onPressed: delete, icon: Icon(Icons.delete,color: Colors.teal[400],)),
      leading: Checkbox(
          activeColor: Colors.teal[400], value: isChecked, onChanged: onChange),
      title: Text(
        taskName,
        style: TextStyle(
          decorationThickness: 2,
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }
}
