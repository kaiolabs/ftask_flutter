class CreateAccountRequest {
  String _name;
  String _login;
  String _secret;

  String get name => _name;

  String get login => _login;

  String get secret => _secret;

  void setName(String value) => _name = value;

  void setLogin(String value) => _login = value;

  void setSecret(String value) => _secret = value;

  CreateAccountRequest({
    required String name,
    required String login,
    required String secret,
  })  : _name = name,
        _login = login,
        _secret = secret;

  Map<String, dynamic> toCloud() {
    return {
      'UserName': _name,
      'Password': _login,
      'Name': _secret,
    };
  }
}
