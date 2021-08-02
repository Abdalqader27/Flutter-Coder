import 'package:moor_flutter/moor_flutter.dart';

import '../../../abstract_ddm/i_delete.dart';
import '../../../moor_database.dart';

class TaskDeleting extends DatabaseAccessor<AppDatabase> implements IDelete<TaskData> {
  TaskDeleting(AppDatabase attachedDatabase) : super(attachedDatabase);

  @override
  Future deleteAll() {
    return delete(db.task).go();
  }

  @override
  Future deleteById(int id) {
    return (delete(db.task)..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future deleteByText(String text) {
    return (delete(db.task)..where((tbl) => tbl.name.contains(text))).go();
  }

  @override
  Future deleteByIds(List<int> deletedId) {
    return (delete(db.task)..where((tbl) => tbl.id.isIn(deletedId))).go();
  }

  @override
  Future deleteItem(TaskData task) {
    return (delete(db.task).delete(task));
  }
}
