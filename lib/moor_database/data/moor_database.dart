import 'package:moor_flutter/moor_flutter.dart';

import '../data/dao/_export_dao.dart';
import '../data/tables/_tables_export.dart';

part 'moor_database.g.dart';

@UseMoor(tables: [Task, Tag], daos: [TaskDao, TagDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (Migrator m, int from, int to) async {
          if (from == 1) {
            m.addColumn(task, task.tagName);
            m.createTable(tag);
          }
        },
        beforeOpen: (OpeningDetails details) async {
          await customStatement('PRAGMA foreign_keys = on');
        },
      );
}
