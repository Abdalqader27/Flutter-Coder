import 'package:futter_coder/moor_database/models/task_with_tag.dart';
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

  //////////////////////////// non override
  Stream<List<TaskData>> watchAllCompleted() {
    return (select(db.task)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date),
            (t) => OrderingTerm(expression: t.name),
          ])
          ..where((tbl) => tbl.completed.equals(true)))
        .watch();
  }

  Stream<List<TaskWithTag>> watchAllTaskWithTags() {
    // Wrap the whole select statement in parenthesis
    return (select(db.task)
          // Statements like orderBy and where return void => the need to use a cascading ".." operator
          ..orderBy(
            ([
              // Primary sorting by due date
              (t) => OrderingTerm(expression: t.date, mode: OrderingMode.asc),
              // Secondary alphabetical sorting
              (t) => OrderingTerm(expression: t.name),
            ]),
          ))
        // As opposed to orderBy or where, join returns a value. This is what we want to watch/get.
        .join(
          [
            // Join all the tasks with their tags.
            // It's important that we use equalsExp and not just equals.
            // This way, we can join using all tag names in the tasks table, not just a specific one.
            leftOuterJoin(db.tag, db.tag.name.equalsExp(db.task.tagName)),
          ],
        )
        // watch the whole select statement including the join
        .watch()
        // Watching a join gets us a Stream of List<TypedResult>
        // Mapping each List<TypedResult> emitted by the Stream to a List<TaskWithTag>
        .map(
          (rows) => rows.map(
            (row) {
              return TaskWithTag(
                task: row.readTable(db.task),
                tag: row.readTable(db.tag),
              );
            },
          ).toList(),
        );
  }
}
