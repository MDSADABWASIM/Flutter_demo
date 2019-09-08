import 'package:moor_flutter/moor_flutter.dart';
part 'localDb.g.dart'; // generated class

//Defining our Database class with moor library.
class Tasks extends Table {
  //its our primary key
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get markerId => text().withLength(min: 1, max: 50)();
  RealColumn get lang => real()();
  RealColumn get lat => real()();
}

@UseMoor(tables: [Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      :  super(
        FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

@override
int get schemaVersion =>2;

Future<List<Task>> getAllTask()=> select(tasks).get();
Stream<List<Task>> watchAllTask()=> select(tasks).watch();
Future insertTask(Task task)=> into(tasks).insert(task);
Future updateTask(Task task)=> update(tasks).replace(task);
Future deleteTask(Task task)=> delete(tasks).delete(task);
}
