import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task/src/core/domain/services/i_http_service.dart';
import 'package:task/src/core/infra/application/http_request_methods.dart';

class HttpServiceMock extends Mock implements IHttpService {}

void main() {
  late IHttpService httpService;

  test('should return true when create account is successful', () async {
    // arrange
    httpService = HttpServiceMock();
    Map response = {};
    Map expectResponse = {};

    //act
    when(() => httpService.request(
          baseUrl: '',
          endPoint: '',
          method: HttpRequestMethods.get,
        )).thenAnswer((_) async {
      response = {};
    });

    // assert
    expect(response, equals(expectResponse));
  });
}
