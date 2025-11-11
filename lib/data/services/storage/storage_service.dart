abstract class StorageService {
  Future<void> write(String key, String data);
  Future<dynamic> read(String key);
  Future<void> delete(String key);
}
