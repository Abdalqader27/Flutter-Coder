import 'package:moor_flutter/moor_flutter.dart';

import '../../../abstract_ddm/i_get.dart';
import '../../../moor_database.dart';

class TaskGetting extends DatabaseAccessor<AppDatabase> implements IGet<TaskData> {
  TaskGetting(AppDatabase attachedDatabase) : super(attachedDatabase);

  @override
  Future<List<TaskData>?> getAll() {
    return (select(db.task)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.name, mode: OrderingMode.desc),
          ]))
        .get();
  }

  @override
  Future<List<TaskData>?> getAllByText(String text) {
    return (select(db.task)..where((tbl) => tbl.name.contains(text))).get();
  }

  @override
  Future<TaskData?> getById(int id) {
    return (select(db.task)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<List<TaskData>?> getByIds(List<int> ids) {
    return (select(db.task)..where((tbl) => tbl.id.isIn(ids))).get();
  }

  @override
  Future<int> getCount() {
    final count = db.task.id.count();
    final query = selectOnly(db.task)..addColumns([count]);
    final result = query.map((e) => e.read(count)).getSingle();
    return result;
  }

  @override
  Stream<List<TaskData>> watchAll() {
    return (select(db.task).watch());
  }

  Stream<List<TaskData>> watchAllCompleted() {
    return (select(db.task)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date),
            (t) => OrderingTerm(expression: t.name),
          ])
          ..where((tbl) => tbl.completed.equals(true)))
        .watch();
  }

  @override
  Stream<TaskData?> watchById(int id) {
    return (select(db.task)..where((tbl) => tbl.id.equals(id))).watchSingleOrNull();
  }

  @override
  Stream<List<TaskData>?> watchByIds(List<int> ids) {
    return (select(db.task)..where((tbl) => tbl.id.isIn(ids))).watch();
  }

  @override
  Stream<int> watchCount() {
    final count = db.task.id.count();
    final query = selectOnly(db.task)..addColumns([count]);
    final result = query.map((e) => e.read(count)).watchSingle();
    return result;
  }
}
