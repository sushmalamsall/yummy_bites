import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:yummy_bites/core/logger/logger_service.dart';
import 'package:yummy_bites/core/services/state_data_service/user_data_service.dart';
import 'package:yummy_bites/data/models/api_failure.dart';
import 'package:yummy_bites/data/models/network_failure.dart';

class ApiErrorInterceptor extends Interceptor {
  final Log _log = Log(ApiErrorInterceptor);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    Map<String, dynamic> error = {
      if (err.requestOptions.data != null &&
          err.requestOptions.data is Map<String, dynamic>)
        "request": err.requestOptions.data,
      "stackTrace": err.stackTrace.toString(),
      "type": err.type.toString(),
      "err": err.toString(),
      "statusCode": err.response?.statusCode,
      "response": err.response?.data,
    };

    if (kDebugMode) {
      print("--------------------------------------");
    }
    _log.d(error);
    if (kDebugMode) {
      print("--------------------------------------");
    }

    if (err.response != null) {
      try {
        ApiFailure response = ApiFailure.fromJson(
          (err.response?.data is Map<String, dynamic>)
              ? err.response?.data
              : (err.response?.data != null && err.response?.data is String)
              ? jsonDecode(err.response!.data)
              : null,
        );

        throw NetworkFailure(
          apiFailure: response,
          request: err.requestOptions,
          type: err.type,
          error: response,
          message: err.message,
          response: err.response,
          stackTrace: err.stackTrace,
        );
      } catch (e) {
        if (e is NetworkFailure) {
          if (e.response?.statusCode == 401 &&
              e.apiFailure.publicError.contains("Bad Token")) {
            await UserDataService().logout();
            // RouterHelper().clearStackAndShowOnboardingView();
            return;
          }

          return handler.next(
            NetworkFailure(
              apiFailure: e.apiFailure,
              request: err.requestOptions,
            ),
          );
        }

        return handler.next(
          NetworkFailure(
            apiFailure: NoInternetApiFailure(),
            request: err.requestOptions,
          ),
        );
      }
    } else {
      return handler.next(
        NetworkFailure(
          apiFailure: NoInternetApiFailure(),
          request: err.requestOptions,
        ),
      );
    }
  }
}
