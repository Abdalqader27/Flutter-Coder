import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("TaskData")
class Task extends Table {
  //auto inc
  IntColumn get id => integer().nullable()();

  TextColumn get name => text().withLength(min: 0, max: 255)();

  DateTimeColumn get date => dateTime().nullable()();

  BoolColumn get completed => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
