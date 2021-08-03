import 'package:moor/moor.dart';

abstract class IInsert<T> {
  Future<dynamic> insertItem(Insertable<T> data);

  Future<dynamic> insertAllItems(List<T> dataList);
}
