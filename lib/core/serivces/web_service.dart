
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../config/constants.dart';

class WebServices {
  static WebServices? _this;

  Dio freeDio = Dio();
  Dio tokenDio = Dio();

  WebServices._() {

    freeDio.options.connectTimeout = 30000;
    freeDio.options.baseUrl = Constants.baseUrl;

    tokenDio.options.connectTimeout = 30000;
    tokenDio.options.baseUrl = Constants.baseUrl;
    initializeInterceptors();
  }

  factory WebServices() {
    // if _this = null, return WebServices else return _this;
    _this ??= WebServices._();
    return _this!;
  }

  initializeInterceptors() {
    // Clearing Interceptors
    freeDio.interceptors.clear();
    tokenDio.interceptors.clear();

    // freeDio Interceptors
    freeDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {

          options.headers = {
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiM2Y4MGZiMGY3ZjlhNjNiYTVjNTg5ZTFiYjlhN2I3OCIsInN1YiI6IjY2MTA4Njg4ZDc2OGZlMDE2MjQxMTc4YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y9mirqCaeoQ8f5ycfeociEcsf5bS99qfv5EEHf0zL0g'
          };
          debugPrint(
              'send request：path:${options.path}，baseURL:${options.baseUrl}');
          debugPrint('headers: ${options.headers}');
          debugPrint('query parameters: ${options.queryParameters}');
          debugPrint('data: ${options.data}');

          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          debugPrint("status code: ${response.statusCode}");
          debugPrint("data: ${response.data}");

          log(response.data.toString());
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('data: ${e.response?.data}');
          debugPrint("error ${e.error}");
          debugPrint("message ${e.message}");
          debugPrint("type ${e.type}");

          /// Todo Handeling EasyLoading
          EasyLoading.dismiss();

          if (e.response != null) {
            if (e.response!.statusCode == 401 ||
                e.response!.statusCode == 403) {
              return handler.next(e);
            } else {
              // 500 error internal
              // Sn.showUnExpectedErrorToast();
            }
          } else {
            debugPrint(e.requestOptions.path);
            debugPrint(e.toString());

            // ToastService.showErrorToast("No Internet Connection");
          }
        },
      ),
    );
  }
}
