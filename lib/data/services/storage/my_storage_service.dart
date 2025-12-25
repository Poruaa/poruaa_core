import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:poruaa_core/data/services/storage/storage_service.dart';

class MyStorageService extends StorageService {
  final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
    wOptions: const WindowsOptions(useBackwardCompatibility: true),
  );
  @override
  Future<void> delete(String key) => _storage.delete(key: key);

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);
}
