import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("TagData")
class Tag extends Table {
  TextColumn get name => text().withLength(min: 0, max: 100)();

  IntColumn get color => integer()();

  @override
  Set<Column> get primaryKey => {name};
}
