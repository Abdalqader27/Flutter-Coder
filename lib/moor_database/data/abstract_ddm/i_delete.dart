abstract class IDelete<T> {
  Future<dynamic> deleteByIds(List<int> deletedId);

  Future<dynamic> deleteById(int id);

  Future<dynamic> deleteByText(String text);

  Future<dynamic> deleteAll();

  Future deleteItem(T item);
}
