import 'entity_base.dart';

class UserEntity extends EntityBase {
  String _login;
  String _secret;
  String _name;
  String _role;
  String _token;

  String get login => _login;

  String get secret => _secret;

  String get name => _name;

  String get role => _role;

  String get token => _token;

  void setLogin(String? value) => _login = value ?? '';

  void setSecret(String? value) => _secret = value ?? '';

  void setName(String? value) => _name = value ?? '';

  void setRole(String? value) => _role = value ?? '';

  void setToken(String? value) => _token = value ?? '';

  UserEntity({
    required String login,
    required String secret,
    required String name,
    required String role,
    required String token,
    required String id,
    required int created,
    required int persisted,
    int? deleted,
  })  : _login = login,
        _secret = secret,
        _name = name,
        _role = role,
        _token = token,
        super(
          id: id,
          created: created,
          persisted: persisted,
          deleted: deleted,
        );

  @override
  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'secret': secret,
      'name': name,
      'token': token,
      'id': id,
      'created': created,
      'role': role,
      'persisted': persisted,
      'deleted': deleted,
      'updated': updated,
    };
  }

  factory UserEntity.fromJson(dynamic map) {
    return UserEntity(
      id: map['id'] as String,
      created: map['created'] as int,
      login: map['login'] as String,
      secret: map['secret'] as String,
      name: map['name'] as String,
      token: map['token'] as String,
      role: map['role'] as String,
      persisted: map['persisted'] as int,
      deleted: map['deleted'] as int?,
    );
  }

  factory UserEntity.fromAuth(Map<String, dynamic> map) {
    return UserEntity(
      id: map['person']['id'] as String,
      created: DateTime.tryParse(map['person']['insertDate'])?.millisecondsSinceEpoch ?? 0,
      login: map['person']['username'] as String,
      secret: map['person']['password'] as String,
      name: map['person']['name'] as String,
      token: map['token'] as String,
      role: map['person']['role'] as String,
      persisted: DateTime.tryParse(map['person']['insertDate'])?.millisecondsSinceEpoch ?? 0,
    );
  }

  factory UserEntity.empty() {
    return UserEntity(
      id: '',
      created: 0,
      login: '',
      secret: '',
      name: '',
      token: '',
      role: '',
      persisted: 0,
    );
  }

  void setAuthUser(UserEntity user) {
    setId(user.id);
    setCreated(user.created);
    setLogin(user.login);
    setSecret(user.secret);
    setName(user.name);
    setRole(user.role);
    setToken(user.token);
  }
}
