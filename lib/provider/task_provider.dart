import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  final TaskController _controller = TaskController();
  TaskProvider(){
    read();
  }

  Future<bool> createTask({required Task task}) async {
    int id = await _controller.create(task);
    if (id != 0) {
      task.id = id;
      tasks.add(task);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> read() async {
    tasks = await _controller.read();
    notifyListeners();
  }

  Future<bool>updateStatus({required Task task})async{
    bool updated = await _controller.update(task);
    if(updated){
      int index = tasks.indexWhere((element)=> element.id == task.id);
      tasks[index].isDone = !tasks[index].isDone;
      notifyListeners();
      return true;
    }
    return false ;
  }

  Future<bool> delete(int id)async{
   bool deleted = await _controller.delete(id);
   if(deleted){
     int index = tasks.indexWhere((element)=> element.id == id);
     tasks.removeAt(index);
     notifyListeners();
     return true ;
   }
   return false ;

  }
}
