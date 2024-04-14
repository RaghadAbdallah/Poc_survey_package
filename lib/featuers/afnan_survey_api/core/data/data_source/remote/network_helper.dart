import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../constants.dart';

Duration connectTimeoutDuration = const Duration(seconds: 50000);
Duration connectReceiveTimeout = const Duration(seconds: 50000);

class NetworkHelper {
  static String get baseURL => URLConstant.apiBaseURL;
  static late final Dio dio;

  static void init() {
    log('dio init');
    log(baseURL);
    final BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      connectTimeout: connectTimeoutDuration,
      receiveTimeout: connectReceiveTimeout,
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }
  static Future<dynamic> getData({
    required String endpoint,
    Options? options,
  }) async {
    final Response<dynamic> response = await dio.get(endpoint,
        options: options ??
            Options(
              headers: {},
              receiveDataWhenStatusError: true,
            ), );
    final dynamic data = response.data; // استخدام response.data بدلاً من response.toString()
    return data;
  }

  static Future<dynamic> postData(
      {required String endpoint,
      String? query,
      Options? options,
      Map<String, dynamic>? header}) async {
    final Response<dynamic> response = await dio.post(
      endpoint,
      options: options ??
          Options(
              headers: {},
              responseType: ResponseType.plain,
              receiveDataWhenStatusError: true),
      data: query,
    );

    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.toString());
      return data;
    } else if (response.statusCode == 500) {
      throw Exception('server Error --${response.statusCode} ');
    } else if (response.statusCode == 401) {
      throw Exception('server Error --${response.statusCode} ');
    } else {
      throw Exception('server Error ');
    }
  }
}
