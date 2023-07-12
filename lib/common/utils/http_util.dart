import 'package:dio/dio.dart';
import 'package:edtech/common/values/constant.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.SERVER_API_URL,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {},
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);

    dio = Dio(options);
  }

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var response =
        await dio.post(path, data: data, queryParameters: queryParameters);
    print("My response data is ${response.data}");
    return response.data;
  }
}
