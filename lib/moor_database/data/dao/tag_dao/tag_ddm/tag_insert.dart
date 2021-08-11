import 'package:moor_flutter/moor_flutter.dart';

import '../../../abstract_ddm/i_insert.dart';
import '../../../moor_database.dart';

class TagInserting extends DatabaseAccessor<AppDatabase> with IInsert<TagData> {
  TagInserting(AppDatabase attachedDatabase) : super(attachedDatabase);

  @override
  Future insertItem(Insertable<TagData> data) {
    return into(db.tag).insert(data);
  }

  @override
  Future insertAllItems(List<TagData> dataList) {
    return transaction(() {
      return batch((batch) => batch.insertAll(
            db.tag,
            dataList,
            mode: InsertMode.insertOrIgnore,
          ));
    });
  }
}
