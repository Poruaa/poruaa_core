import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoService {
  static final DeviceInfoService _instance = DeviceInfoService._internal();
  factory DeviceInfoService() => _instance;
  DeviceInfoService._internal();

  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Get detailed device information including model
  Future<String> getDetailedDeviceInfo() async {
    try {
      if (Platform.isAndroid) {
        return await _getAndroidDeviceInfo();
      } else if (Platform.isIOS) {
        return await _getIOSDeviceInfo();
      } else {
        return getSimpleDeviceType();
      }
    } catch (e) {
      return getSimpleDeviceType();
    }
  }

  /// Get Android device information
  Future<String> _getAndroidDeviceInfo() async {
    final androidInfo = await _deviceInfo.androidInfo;
    final packageInfo = await PackageInfo.fromPlatform();

    String deviceModel = androidInfo.model;
    String manufacturer = androidInfo.manufacturer;

    // Clean up the model name
    if (deviceModel.toLowerCase().contains(manufacturer.toLowerCase())) {
      deviceModel = deviceModel.replaceAll(manufacturer, '').trim();
    }

    // Create a more readable device name
    String deviceName = '$manufacturer $deviceModel'.trim();

    // Add app version for better tracking
    String appVersion = packageInfo.version;

    return 'PoruaaApp/$appVersion ($deviceName; Android ${androidInfo.version.release})';
  }

  /// Get iOS device information
  Future<String> _getIOSDeviceInfo() async {
    final iosInfo = await _deviceInfo.iosInfo;
    final packageInfo = await PackageInfo.fromPlatform();

    String deviceModel = iosInfo.model;
    String deviceName = iosInfo.name;
    String systemName = iosInfo.systemName;
    String systemVersion = iosInfo.systemVersion;

    // Use device name if available, otherwise use model
    String displayName = deviceName.isNotEmpty ? deviceName : deviceModel;

    // Add app version for better tracking
    String appVersion = packageInfo.version;

    return 'PoruaaApp/$appVersion ($displayName; $systemName $systemVersion)';
  }

  /// Get simple device type for fallback
  String getSimpleDeviceType() {
    if (Platform.isAndroid) return 'Android Device';
    if (Platform.isIOS) return 'iOS Device';
    if (Platform.isWindows) return 'Windows Device';
    if (Platform.isMacOS) return 'macOS Device';
    if (Platform.isLinux) return 'Linux Device';
    return 'Unknown Device';
  }
}
