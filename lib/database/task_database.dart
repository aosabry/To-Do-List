import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:to_do_list/models/task_model.dart';

class DatabaseHelper {
  Future<Database> createDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'AllTasks.db');
    
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            notes TEXT,
            priority TEXT,
            date TEXT,
            isDone INTEGER
          )
        ''');
      },
    );
  }

  // ignore: non_constant_identifier_names
  Future<int> insert_task(TaskModel taskmodel)async{
    final db=await createDatabase();
    return await db.insert("tasks",taskmodel.toMap());     
    }

  // ignore: non_constant_identifier_names
  Future<int> delete_task(int id)async{
    final db=await createDatabase();
    return await db.delete("tasks",where: "id = ?",whereArgs: [id]);

  }
  // ignore: non_constant_identifier_names
  Future<int> update_task(TaskModel taskmodel)async{
    final db=await createDatabase();
    return await db.update("tasks",taskmodel.toMap(),where: "id = ?",whereArgs: [taskmodel.id]);

  }
  // ignore: non_constant_identifier_names
  Future<List<TaskModel>>get_tasks()async{
    final db=await createDatabase();
    final List<Map<String, dynamic>> data = await db.query("tasks");
    return data.map((d){
      return TaskModel.fromMap(d);

    }).toList();

}}