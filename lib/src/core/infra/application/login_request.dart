class LoginRequest {
  String _login;
  String _secret;

  String get login => _login;

  set login(String? value) => _login = value ?? '';

  String get secret => _secret;

  set secret(String? value) => _secret = value ?? '';

  LoginRequest({
    required String login,
    required String secret,
  })  : _login = login,
        _secret = secret;

  factory LoginRequest.empty() {
    return LoginRequest(
      login: '',
      secret: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': login.toString(),
      'password': secret.toString(),
    };
  }

  static LoginRequest fromJson(dynamic data) {
    return LoginRequest(
      login: data['login'],
      secret: data['secret'],
    );
  }
}
