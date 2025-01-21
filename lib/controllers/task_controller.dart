import 'package:sqflite/sqflite.dart';
import 'package:todo_app/database/database_controller.dart';
import 'package:todo_app/database/db_operations.dart';
import 'package:todo_app/models/task.dart';

class TaskController extends DbOperations<Task> {
  Database db = DbController().database;

  @override
  Future<int> create(Task object) async {
    return await db.insert('tasks', object.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]) > 0;
  }

  @override
  Future<List<Task>> read() async {
    List<Map<String, dynamic>> rows = await db.query('tasks');

    if (rows.isNotEmpty) {
      return rows.map((rowMap) => Task.fromMap(rowMap)).toList();
    }
    return [];
  }

  @override
  Future<bool> update(Task object) async {
    return await db.update('tasks', object.toMap(),
            where: 'id = ?', whereArgs: [object.id]) >
        0;
  }
}
