import 'package:flutter_test/flutter_test.dart';
import 'package:task/src/core/domain/entities/user_entity.dart';

void main() {
  //teste create a new instance of TaskEntity with all parameters
  test('create a new instance of UserEntity with all parameters', () {
    UserEntity userEntity = UserEntity(
      login: '',
      secret: '',
      name: '',
      role: '',
      token: '',
      id: '',
      created: 0,
      persisted: 0,
    );

    expect(userEntity.login, '');
    expect(userEntity.secret, '');
    expect(userEntity.name, '');
    expect(userEntity.role, '');
    expect(userEntity.token, '');
    expect(userEntity.id, '');
    expect(userEntity.created, 0);
    expect(userEntity.persisted, 0);
    expect(userEntity.deleted, null);
    expect(userEntity.updated, null);
  });

  //test create a new instance of UserEntity.empty
  test('create a new instance of UserEntity.empty', () {
    UserEntity userEntity = UserEntity.empty();
    expect(userEntity.login, '');
    expect(userEntity.secret, '');
    expect(userEntity.name, '');
    expect(userEntity.role, '');
    expect(userEntity.token, '');
  });

  //test setLogin
  test('setLogin', () {
    UserEntity userEntity = UserEntity.empty();
    userEntity.setLogin('login');
    expect(userEntity.login, 'login');
  });

  //test setSecret
  test('setSecret', () {
    UserEntity userEntity = UserEntity.empty();
    userEntity.setSecret('secret');
    expect(userEntity.secret, 'secret');
  });

  //test setName
  test('setName', () {
    UserEntity userEntity = UserEntity.empty();
    userEntity.setName('name');
    expect(userEntity.name, 'name');
  });

  //test setRole
  test('setRole', () {
    UserEntity userEntity = UserEntity.empty();
    userEntity.setRole('role');
    expect(userEntity.role, 'role');
  });

  //test setToken
  test('setToken', () {
    UserEntity userEntity = UserEntity.empty();
    userEntity.setToken('token');
    expect(userEntity.token, 'token');
  });

  test('UserEntity from empty to json', () {
    UserEntity userEntity = UserEntity.empty();
    expect(userEntity.toJson(), {
      'login': '',
      'secret': '',
      'name': '',
      'role': '',
      'token': '',
      'id': '',
      'created': 0,
      'persisted': 0,
      'deleted': null,
      'updated': null,
    });
  });

  test('UserEntity from json to empty', () {
    UserEntity userEntity = UserEntity.fromJson({
      'login': '',
      'secret': '',
      'name': '',
      'role': '',
      'token': '',
      'id': '',
      'created': 0,
      'persisted': 0,
      'deleted': null,
      'updated': null,
    });
    expect(userEntity.login, '');
    expect(userEntity.secret, '');
    expect(userEntity.name, '');
    expect(userEntity.role, '');
    expect(userEntity.token, '');
    expect(userEntity.id, '');
    expect(userEntity.created, 0);
    expect(userEntity.persisted, 0);
    expect(userEntity.deleted, null);
    expect(userEntity.updated, null);
  });

  test('UserEntity fromAuth from empty Map<String, dyamic>', () {
    UserEntity userEntity = UserEntity.fromAuth({
      'person': {
        'id': '',
        'insertDate': '',
        'username': '',
        'password': '',
        'name': '',
        'role': '',
      },
      'token': '',
    });
    expect(userEntity.login, '');
    expect(userEntity.secret, '');
    expect(userEntity.name, '');
    expect(userEntity.role, '');
    expect(userEntity.token, '');
    expect(userEntity.id, '');
    expect(userEntity.created, 0);
    expect(userEntity.persisted, 0);
    expect(userEntity.deleted, null);
    expect(userEntity.updated, null);
  });

  test('UserEntity setAuth user fromEmpty', () {
    UserEntity userEntity = UserEntity.empty();
    userEntity.setAuthUser(UserEntity.empty());
    expect(userEntity.login, '');
    expect(userEntity.secret, '');
    expect(userEntity.name, '');
    expect(userEntity.role, '');
    expect(userEntity.token, '');
    expect(userEntity.id, '');
    expect(userEntity.created, 0);
    expect(userEntity.persisted, 0);
    expect(userEntity.deleted, null);
    expect(userEntity.updated, null);
  });
}
