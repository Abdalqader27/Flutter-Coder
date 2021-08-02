abstract class IGet<T> {
  Future<List<T>?> getAll();

  Future<T?> getById(int id);

  Future<List<T>?> getByIds(List<int> ids);

  Future<List<T>?> getAllByText(String text);

  Future<int> getCount();

  Stream<List<T>?> watchAll();

  Stream<List<T>?> watchByIds(List<int> ids);

  Stream<T?> watchById(int id);

  Stream<int> watchCount();
}
