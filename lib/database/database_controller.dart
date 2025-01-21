import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  static final DbController _instance = DbController._();

  late Database _database;

  DbController._();

  factory DbController() {
    return _instance;
  }

  Future<void> initDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'todo_db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version)async {
        await db.execute('CREATE TABLE tasks ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT,'
            'isDone BOOLEAN'
            ') ');
      },
      onOpen: (db) {},
    );
  }
  Database get database => _database ;
}
