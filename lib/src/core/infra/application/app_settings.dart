abstract class AppSettings {
  static const bool appHasHubConnection = true;
  static const int appHubConnectionTimeoutSeconds = 5;
  static const int timerInterval = 1000;

  static const String baseApiUrl = 'http://192.168.15.3:5001';
  static const String baseHubUrl = 'http://192.168.15.3:5002/chatHub';
  static const String obscuringCharacter = 'ж';
  static const int initialPageIndex = 1;
}
