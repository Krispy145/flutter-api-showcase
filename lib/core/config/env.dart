/// Environment configuration loaded from --dart-define
class Env {
  static const String _baseUrl = String.fromEnvironment(
    'PEXELS_BASE_URL',
    defaultValue: 'https://api.pexels.com',
  );

  static const String _apiKey = String.fromEnvironment(
    'PEXELS_API_KEY',
    defaultValue: '',
  );

  static const String _appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'API Showcase',
  );

  static String get baseUrl => _baseUrl;
  static String get apiKey => _apiKey;
  static String get appName => _appName;
}
