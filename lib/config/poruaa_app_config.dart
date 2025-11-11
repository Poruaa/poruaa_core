class PoruaaAppConfig {
  final String baseUrl;
  final String webGoogleClientId;
  final String webGoogleServerClientId;
  final String redirectUri;
  final String androidGoogleClientId;
  final String devAndroidGoogleClientId;

  PoruaaAppConfig({
    required this.baseUrl,
    required this.webGoogleClientId,
    required this.redirectUri,
    required this.webGoogleServerClientId,
    required this.androidGoogleClientId,
    required this.devAndroidGoogleClientId,
  });
}
