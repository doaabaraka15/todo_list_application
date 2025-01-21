abstract class DbOperations<T> {
  Future<List<T>> read();

  Future<bool> update(T object);

  Future<bool> delete(int id);

  Future<int> create(T object);
}
