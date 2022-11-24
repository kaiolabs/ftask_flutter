import '../../infra/application/http_request_methods.dart';

abstract class IHttpService {
  Future<dynamic> request({
    required String baseUrl,
    required String endPoint,
    required HttpRequestMethods method,
    dynamic params,
    int? connectTimeout,
    int? receiveTimeout,
    String? token,
  });
}
