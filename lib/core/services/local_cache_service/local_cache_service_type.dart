abstract class LocalCacheServiceType {
  Future<void> store<T>(String key, T value, {Function? toJson});

  Future<T?> retrieve<T>(String key, {Function? fromJson});

  clear();

  remove(String key);
}
