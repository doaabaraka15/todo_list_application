import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, provider, widget) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            taskName: provider.tasks[index].name,
            isChecked: provider.tasks[index].isDone,
            onChange: (value) {
              provider.updateStatus(task: provider.tasks[index]);
            },
            delete: () {
              Provider.of<TaskProvider>(context,listen: false).delete(provider.tasks[index].id);
            },
          );
        },
        itemCount: Provider.of<TaskProvider>(context).tasks.length,
      );
    });
  }
}
