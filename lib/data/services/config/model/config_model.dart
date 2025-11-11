class ConfigModel {
  final Map<String, dynamic> data;

  ConfigModel({required this.data});

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(data: json);
  }

  Map<String, dynamic> toJson() {
    return data;
  }

  // Helper methods to access specific config values
  String? getString(String key) {
    final value = data[key];
    return value is String ? value : null;
  }

  int? getInt(String key) {
    final value = data[key];
    return value is int ? value : null;
  }

  double? getDouble(String key) {
    final value = data[key];
    return value is double ? value : null;
  }

  bool? getBool(String key) {
    final value = data[key];
    return value is bool ? value : null;
  }

  Map<String, dynamic>? getMap(String key) {
    final value = data[key];
    return value is Map<String, dynamic> ? value : null;
  }

  List<dynamic>? getList(String key) {
    final value = data[key];
    return value is List ? value : null;
  }

  // Check if a key exists
  bool hasKey(String key) {
    return data.containsKey(key);
  }

  // Get all keys
  Iterable<String> get keys => data.keys;

  @override
  String toString() {
    return 'ConfigModel(data: $data)';
  }
}
