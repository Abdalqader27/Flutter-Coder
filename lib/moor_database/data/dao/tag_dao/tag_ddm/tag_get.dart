import 'package:moor_flutter/moor_flutter.dart';

import '../../../abstract_ddm/i_get.dart';
import '../../../moor_database.dart';

class TagGetting extends DatabaseAccessor<AppDatabase> implements IGet<TagData> {
  TagGetting(AppDatabase attachedDatabase) : super(attachedDatabase);

  @override
  Future<List<TagData>?> getAll() {
    return (select(db.tag)).get();
  }

  @override
  Future<List<TagData>?> getAllByText(String text) {
    return (select(db.tag)..where((tbl) => tbl.name.contains(text))).get();
  }

  @override
  Stream<List<TagData>> watchAll() {
    return (select(db.tag).watch());
  }

  @override
  Future<TagData?> getById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<TagData>?> getByIds(List<int> ids) {
    throw UnimplementedError();
  }

  @override
  Future<int> getCount() {
    throw UnimplementedError();
  }

  @override
  Stream<TagData?> watchById(int id) {
    throw UnimplementedError();
  }

  @override
  Stream<List<TagData>?> watchByIds(List<int> ids) {
    throw UnimplementedError();
  }

  @override
  Stream<int> watchCount() {
    throw UnimplementedError();
  }
}
