import 'package:futter_coder/moor_database/data/tables/task.dart';
import 'package:moor_flutter/moor_flutter.dart';

import '../../moor_database.dart';
import 'task_ddm/task_delete.dart';
import 'task_ddm/task_get.dart';
import 'task_ddm/task_insert.dart';
import 'task_ddm/task_update.dart';

part 'task_dao.g.dart';

@UseDao(tables: [Task])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(AppDatabase attachedDatabase) : super(attachedDatabase) {
    _inserting = TaskInserting(db);
    _deleting = TaskDeleting(db);
    _updating = TaskUpdating(db);
    _getting = TaskGetting(db);
  }

  late final TaskDeleting _deleting;
  late final TaskGetting _getting;
  late final TaskInserting _inserting;
  late final TaskUpdating _updating;

  TaskGetting get getting => _getting;

  TaskUpdating get updating => _updating;

  TaskInserting get inserting => _inserting;

  TaskDeleting get deleting => _deleting;
}
