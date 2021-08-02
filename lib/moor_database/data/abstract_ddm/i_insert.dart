abstract class IInsert<T> {
  Future<dynamic> insertItem(T data);

  Future<dynamic> insertAllItems(List<T> dataList);
}
