import 'package:futter_coder/moor_database/data/dao/tag_dao/tag_ddm/tag_get.dart';
import 'package:moor_flutter/moor_flutter.dart';

import '../../moor_database.dart';
import '../../tables/_tables_export.dart';
import 'tag_ddm/tag_insert.dart';

part 'tag_dao.g.dart';

@UseDao(tables: [Tag])
class TagDao extends DatabaseAccessor<AppDatabase> with _$TagDaoMixin {
  TagDao(AppDatabase attachedDatabase) : super(attachedDatabase) {
    _inserting = TagInserting(db);
// _deleting = TaskDeleting(db);
// _updating = TaskUpdating(db);
    _getting = TagGetting(db);
  }

// late final TaskDeleting _deleting;
  late final TagGetting _getting;
  late final TagInserting _inserting;

// late final TaskUpdating _updating;

  TagGetting get getting => _getting;

//
// TaskUpdating get updating => _updating;

  TagInserting get inserting => _inserting;

// TaskDeleting get deleting => _deleting;
}
