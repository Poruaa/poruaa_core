import 'package:poruaa_core/data/services/storage/storage_service.dart';

/// Model for R2 credentials
class R2Credentials {
  final String accountId;
  final String accessKeyId;
  final String secretAccessKey;
  final String bucketName;
  final String? customDomainUrl;
  final String? endpointUrl;

  R2Credentials({
    required this.accountId,
    required this.accessKeyId,
    required this.secretAccessKey,
    required this.bucketName,
    this.customDomainUrl,
    this.endpointUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId,
      'accessKeyId': accessKeyId,
      'secretAccessKey': secretAccessKey,
      'bucketName': bucketName,
      'customDomainUrl': customDomainUrl,
      'endpointUrl': endpointUrl,
    };
  }

  factory R2Credentials.fromJson(Map<String, dynamic> json) {
    return R2Credentials(
      accountId: json['accountId'] ?? '',
      accessKeyId: json['accessKeyId'] ?? '',
      secretAccessKey: json['secretAccessKey'] ?? '',
      bucketName: json['bucketName'] ?? '',
      customDomainUrl: json['customDomainUrl'],
      endpointUrl: json['endpointUrl'],
    );
  }

  @override
  String toString() {
    return 'R2Credentials(accountId: $accountId, accessKeyId: $accessKeyId, '
        'bucketName: $bucketName, customDomainUrl: $customDomainUrl, '
        'endpointUrl: $endpointUrl)';
  }
}

/// Repository for managing Cloudflare R2 credentials
class R2CredentialsRepository {
  static const String _keyAccountId = 'r2_account_id';
  static const String _keyAccessKeyId = 'r2_access_key_id';
  static const String _keySecretAccessKey = 'r2_secret_access_key';
  static const String _keyBucketName = 'r2_bucket_name';
  static const String _keyCustomDomainUrl = 'r2_custom_domain_url';
  static const String _keyEndpointUrl = 'r2_endpoint_url';

  final StorageService _secureStorage;

  R2CredentialsRepository(this._secureStorage);

  /// Get R2 credentials
  Future<R2Credentials?> getCredentials() async {
    try {
      final accountId = await _secureStorage.read(_keyAccountId);
      final accessKeyId = await _secureStorage.read(_keyAccessKeyId);
      final secretAccessKey = await _secureStorage.read(_keySecretAccessKey);
      final bucketName = await _secureStorage.read(_keyBucketName);
      final customDomainUrl = await _secureStorage.read(_keyCustomDomainUrl);
      final endpointUrl = await _secureStorage.read(_keyEndpointUrl);

      if (accountId == null ||
          accessKeyId == null ||
          secretAccessKey == null ||
          bucketName == null) {
        return null;
      }

      return R2Credentials(
        accountId: accountId,
        accessKeyId: accessKeyId,
        secretAccessKey: secretAccessKey,
        bucketName: bucketName,
        customDomainUrl: customDomainUrl,
        endpointUrl: endpointUrl,
      );
    } catch (e) {
      return null;
    }
  }

  /// Set R2 credentials
  Future<void> setCredentials(R2Credentials credentials) async {
    await _secureStorage.write(_keyAccountId, credentials.accountId);
    await _secureStorage.write(_keyAccessKeyId, credentials.accessKeyId);
    await _secureStorage.write(
      _keySecretAccessKey,
      credentials.secretAccessKey,
    );
    await _secureStorage.write(_keyBucketName, credentials.bucketName);

    if (credentials.customDomainUrl != null &&
        credentials.customDomainUrl!.isNotEmpty) {
      await _secureStorage.write(
        _keyCustomDomainUrl,
        credentials.customDomainUrl ?? '',
      );
    } else {
      await _secureStorage.delete(_keyCustomDomainUrl);
    }

    if (credentials.endpointUrl != null &&
        credentials.endpointUrl!.isNotEmpty) {
      await _secureStorage.write(
        _keyEndpointUrl,
        credentials.endpointUrl ?? '',
      );
    } else {
      await _secureStorage.delete(_keyEndpointUrl);
    }
  }

  /// Clear all R2 credentials
  Future<void> clearCredentials() async {
    await _secureStorage.delete(_keyAccountId);
    await _secureStorage.delete(_keyAccessKeyId);
    await _secureStorage.delete(_keySecretAccessKey);
    await _secureStorage.delete(_keyBucketName);
    await _secureStorage.delete(_keyCustomDomainUrl);
    await _secureStorage.delete(_keyEndpointUrl);
  }

  /// Check if credentials are set
  Future<bool> hasCredentials() async {
    final accountId = await _secureStorage.read(_keyAccountId);
    final accessKeyId = await _secureStorage.read(_keyAccessKeyId);
    final secretAccessKey = await _secureStorage.read(_keySecretAccessKey);
    final bucketName = await _secureStorage.read(_keyBucketName);

    return accountId != null &&
        accessKeyId != null &&
        secretAccessKey != null &&
        bucketName != null;
  }
}
