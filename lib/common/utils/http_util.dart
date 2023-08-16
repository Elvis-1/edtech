import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';
import 'package:edtech/common/values/constant.dart';

import '../../global.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.SERVER_API_URL,
        connectTimeout: const Duration(minutes: 20),
        receiveTimeout: const Duration(minutes: 20),
        headers: {},
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);

    dio = Dio(options);
  }

  Future postData(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    Options requestOptions = Options();

    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorisation = getAuthorizationHeader();

    if (authorisation != null) {
      requestOptions.headers!.addAll(authorisation);
    }

    try {
      var response = await dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: requestOptions);
      print("My response data is ${response.data}");

      return response.data;
    } catch (e) {
      print('inside dio function ' + e.toString());
    }
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();

    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    return headers;
  }
}
