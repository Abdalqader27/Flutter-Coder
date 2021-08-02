import 'package:futter_coder/moor_database/data/tables/task.dart';
import 'package:moor_flutter/moor_flutter.dart';

import '../data/dao/_export_dao.dart';

part 'moor_database.g.dart';

@UseMoor(tables: [Task], daos: [TaskDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
