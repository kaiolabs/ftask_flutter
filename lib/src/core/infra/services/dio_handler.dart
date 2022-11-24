import 'dart:io';

import 'package:dio/dio.dart';

import '../../presenter/theme/lexicon.dart';
import '../application/custom_exception.dart';
import '../application/http_request_methods.dart';
import '../application/http_timeout_configurations.dart';
import '../application/logger.dart';

class DioHandler {
  Dio? _dio;

  void configureHeader(
    String baseUrl,
    int? connectTimeout,
    int? receiveTimeout,
    String? token,
  ) {
    fLog.w('[BASE URL] => $baseUrl');
    fLog.w('[CT & RT] => $connectTimeout / $receiveTimeout');

    Map<String, dynamic> header = {
      'Content-Type': 'application/json',
    };

    if (token != null) header["Authorization"] = 'Bearer $token';

    _dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        headers: header,
        connectTimeout: connectTimeout ?? HttpTimeoutConfigurations.connectTimeout,
        receiveTimeout: receiveTimeout ?? HttpTimeoutConfigurations.receiveTimeout));
  }

  void configureInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          fLog.w("REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
              "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}");
          "REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
              "=> REQUEST VALUES: ${requestOptions.queryParameters}";
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          fLog.w("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          fLog.w("Error[${err.response?.statusCode}]");
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> call({
    required String baseUrl,
    required String endPoint,
    required HttpRequestMethods method,
    dynamic params,
    int? connectTimeout,
    int? receiveTimeout,
    String? token,
  }) async {
    Response response;

    configureHeader(baseUrl, connectTimeout, receiveTimeout, token);
    configureInterceptors();

    try {
      if (method == HttpRequestMethods.post) {
        response = await _dio!.post(
          endPoint,
          data: params,
        );
      } else if (method == HttpRequestMethods.put) {
        response = await _dio!.put(
          endPoint,
          data: params,
        );
      } else if (method == HttpRequestMethods.delete) {
        response = await _dio!.delete(endPoint);
      } else if (method == HttpRequestMethods.patch) {
        response = await _dio!.patch(endPoint);
      } else {
        response = await _dio!.get(endPoint, queryParameters: params);
      }

      if (response.statusCode == 200 || response.statusCode == 204) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception(Lexicon.unauthorized);
      } else if (response.statusCode == 500) {
        throw Exception(Lexicon.internalServerError);
      } else {
        throw Exception(Lexicon.unknownError);
      }
    } on SocketException catch (e) {
      fLog.e(e);
      throw CustomException(Lexicon.noInternetConnection);
    } on FormatException catch (e) {
      fLog.e(e);
      throw CustomException(Lexicon.formatException);
    } on DioError catch (e) {
      fLog.e(e);
      if (e.type == DioErrorType.response) {
        if (e.response != null && e.response?.data is Map<String, dynamic> && e.response?.data?['message'] != null) {
          throw CustomException(e.response?.data['message']);
        } else if (e.error.toString().contains('[500]')) {
          throw CustomException(Lexicon.internalServerError);
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        throw CustomException(Lexicon.connectTimeout);
      } else if (e.type == DioErrorType.receiveTimeout) {
        throw CustomException(Lexicon.receiveTimeout);
      } else if (e.type == DioErrorType.other) {
        throw CustomException(e.error);
      }
      throw CustomException(e.message);
    } catch (e) {
      fLog.e(e);
      throw CustomException(Lexicon.customException);
    }
  }
}
