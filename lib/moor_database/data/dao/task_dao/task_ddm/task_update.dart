import 'package:futter_coder/moor_database/data/abstract_ddm/i_update.dart';
import 'package:moor_flutter/moor_flutter.dart';

import '../../../moor_database.dart';

class TaskUpdating extends DatabaseAccessor<AppDatabase> with IUpdate<TaskData> {
  TaskUpdating(AppDatabase attachedDatabase) : super(attachedDatabase);

  @override
  Future updateItem(TaskData data) {
    return update(db.task).replace(data);
  }
}
