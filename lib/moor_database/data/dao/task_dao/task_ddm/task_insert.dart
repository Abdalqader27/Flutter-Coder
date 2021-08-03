import 'package:moor_flutter/moor_flutter.dart';

import '../../../abstract_ddm/i_insert.dart';
import '../../../moor_database.dart';

class TaskInserting extends DatabaseAccessor<AppDatabase> with IInsert<TaskData> {
  TaskInserting(AppDatabase attachedDatabase) : super(attachedDatabase);

  @override
  Future insertItem(Insertable<TaskData> data) {
    return into(db.task).insert(data);
  }

  @override
  Future insertAllItems(List<TaskData> dataList) {
    return transaction(() {
      return batch((batch) => batch.insertAll(
            db.task,
            dataList,
            mode: InsertMode.insertOrIgnore,
          ));
    });
  }
}
