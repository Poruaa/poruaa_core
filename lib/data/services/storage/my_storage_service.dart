import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:poruaa_core/data/services/storage/storage_service.dart';

class MyStorageService extends StorageService {
  AndroidOptions _getAndroidOptions() => const AndroidOptions();

  WindowsOptions _getWindowsOptions() =>
      const WindowsOptions(useBackwardCompatibility: true);

  FlutterSecureStorage get _storage => FlutterSecureStorage(
    aOptions: _getAndroidOptions(),
    wOptions: _getWindowsOptions(),
  );
  @override
  Future<void> delete(String key) => _storage.delete(key: key);

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);
}
