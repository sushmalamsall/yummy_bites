import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yummy_bites/core/config/http_config.dart';
import 'package:yummy_bites/core/interceptors/api_error_interceptor.dart';
import 'package:yummy_bites/core/interceptors/api_request_interceptor.dart';
import 'package:yummy_bites/core/interceptors/api_response_interceptor.dart';

@module
abstract class ThirdPartyModule {
  @lazySingleton
  NavigationService get navigationService;

  // @lazySingleton
  // PushNotificationService get pushNotificationService;

  @lazySingleton
  DialogService get dialogService;

  @lazySingleton
  SnackbarService get snackBarService;

  @lazySingleton
  BottomSheetService get bottomSheetService;

  @lazySingleton
  Dio get dio {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: HttpConfig.baseUrl,
        connectTimeout: const Duration(minutes: 5),
        receiveTimeout: const Duration(minutes: 5),
        sendTimeout: const Duration(minutes: 5),
      ),
    );

    dio.interceptors.add(ApiRequestInterceptor());
    dio.interceptors.add(ApiResponseInterceptor());
    dio.interceptors.add(ApiErrorInterceptor());

    return dio;
  }
}
