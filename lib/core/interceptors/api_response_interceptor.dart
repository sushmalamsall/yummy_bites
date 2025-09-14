import 'dart:convert';
import 'package:dio/dio.dart';

class ApiResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data != null) {
      if (response.data.runtimeType == String) {
        try {
          // log(response.data);
          response.data = jsonDecode(response.data);
        } catch (_) {}
      }
    }
    return handler.next(response);
  }
}
