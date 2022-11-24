import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task/src/core/domain/entities/user_entity.dart';
import 'package:task/src/core/domain/services/i_http_service.dart';
import 'package:dio/dio.dart';
import 'package:task/src/core/infra/application/api_endpoints.dart';
import 'package:task/src/core/infra/application/app_settings.dart';
import 'package:task/src/core/infra/application/custom_exception.dart';
import 'package:task/src/core/infra/application/http_request_methods.dart';
import 'package:task/src/core/infra/application/http_timeout_configurations.dart';
import 'package:task/src/core/infra/services/http_service.dart';

class HttpServiceMock extends Mock implements IHttpService {}

void main() {
  final httpServiceMock = HttpServiceMock();

  test('Should call auth and return a user auth', () async {
    when(() => httpServiceMock.request(
          baseUrl: any(named: 'baseUrl'),
          endPoint: any(named: 'endPoint'),
          method: HttpRequestMethods.post,
          params: any(named: 'params'),
          connectTimeout: any(named: 'connectTimeout'),
          receiveTimeout: any(named: 'receiveTimeout'),
          token: any(named: 'token'),
        )).thenAnswer((_) async => Response(data: userAuth, requestOptions: RequestOptions(path: ''), statusCode: 200));

    final result = await httpServiceMock.request(
      baseUrl: 'baseUrl',
      endPoint: 'endPoint',
      method: HttpRequestMethods.post,
      params: {},
      connectTimeout: 0,
      receiveTimeout: 0,
      token: 'token',
    );

    expect(result is Response, equals(true));
    expect(result.statusCode, equals(200));
    expect(result.data, equals(userAuth));
  });

  test('Should call auth and return status code 404 and message of error', () async {
    when(() => httpServiceMock.request(
          baseUrl: any(named: 'baseUrl'),
          endPoint: any(named: 'endPoint'),
          method: HttpRequestMethods.post,
          params: any(named: 'params'),
          connectTimeout: any(named: 'connectTimeout'),
          receiveTimeout: any(named: 'receiveTimeout'),
          token: any(named: 'token'),
        )).thenAnswer((_) async => CustomException(errorMsg['message']!));

    final result = await httpServiceMock.request(
      baseUrl: 'baseUrl',
      endPoint: 'endPoint',
      method: HttpRequestMethods.post,
      params: {},
      connectTimeout: 0,
      receiveTimeout: 0,
      token: 'token',
    );

    expect(result is Exception, equals(true));
    expect(result.message, equals(errorMsg['message']!));
  });

  //integracao
  HttpService httpService = HttpService();
  test(tags: 'integration', 'Should call httpservice passing valid credentials and return 200 also a authUser',
      () async {
    var authUser = await httpService.request(
        baseUrl: AppSettings.baseApiUrl,
        endPoint: ApiEndpoints.auth,
        method: HttpRequestMethods.post,
        params: loginRequest,
        receiveTimeout: HttpTimeoutConfigurations.receiveTimeoutUsecase,
        connectTimeout: HttpTimeoutConfigurations.connectTimeoutUsecase);

    expect(UserEntity.fromAuth(userAuth).runtimeType, equals(UserEntity));
  });

  test(
      tags: 'integration',
      'Should call httpservice passing invalid credentials and return 404 also a message of error', () async {
    var authUser = await httpService.request(
        baseUrl: AppSettings.baseApiUrl,
        endPoint: ApiEndpoints.auth,
        method: HttpRequestMethods.post,
        params: loginRequestError,
        receiveTimeout: HttpTimeoutConfigurations.receiveTimeoutUsecase,
        connectTimeout: HttpTimeoutConfigurations.connectTimeoutUsecase);

    expect(authUser is Exception, equals(true));
    expect(authUser.message, equals(errorMsg['message']!));
  });
}

const loginRequestError = {"password": "123", "username": "1223"};
const loginRequest = {"password": "123", "username": "123"};

const errorMsg = {"message": "User not found."};

const userAuth = {
  "person": {
    "name": "Fred",
    "password": "",
    "username": "123",
    "role": "admin",
    "insertDate": "2022-10-15T07:48:15.1542597-03:00",
    "id": "634a8fef86e19b4fc433cdb7",
    "persistenceDate": "0001-01-01T00:00:00+00:00"
  },
  "token":
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI2MzRhOGZlZjg2ZTE5YjRmYzQzM2NkYjciLCJuYW1lIjoiMTIzIiwicm9sZSI6ImFkbWluIiwibmJmIjoxNjY2NTIyOTQ5LCJleHAiOjE2NjY1MzAxNDksImlhdCI6MTY2NjUyMjk0OX0.qTb-YtGiMYxMs3H9jP7R7OF11ZoshEhmBaICHpqxZr0"
};
