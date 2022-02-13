
import 'package:dio_http/dio_http.dart';
import 'package:flutter/cupertino.dart';

class ContentTypeInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers['Content-Type'] = 'application/json';

    super.onRequest(options, handler); //continue
  }

  @override
  void onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.realUri.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(
      DioError err,
      ErrorInterceptorHandler handler,
      ) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.response?.realUri.path}');
    super.onError(err, handler);
  }
}