import 'package:dio/dio.dart';
import 'package:yummy_bites/core/logger/logger_service.dart';
import 'package:yummy_bites/core/services/state_data_service/user_data_service.dart';

class ApiRequestInterceptor extends Interceptor {
  final Log _log = Log(ApiRequestInterceptor);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String pathValue = options.uri.path.substring(1).replaceAll("/", "_");

    options.headers.addAll({
      if (UserDataService().accessToken != null)
        'Authorization': 'Bearer ${UserDataService().accessToken}',
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json, */*',
    });

    options.headers['request_id'] = _buildRequestId(options, pathValue);

    _log.d(
      "REQUEST: [${options.headers['request_id']}] -  ${options.uri.path}",
    );

    if (options.data is Map<String, dynamic>) {
      options.data = (options.data as Map<String, dynamic>).filteredData;
    }

    if (options.queryParameters.isNotEmpty) {
      options.queryParameters = options.queryParameters.filteredData;
    }

    return handler.next(options);
  }

  String _buildRequestId(RequestOptions options, String pathValue) {
    final DateTime timeNow = DateTime.now().toUtc();

    final method = options.method.toLowerCase();
    final date = timeNow.toIso8601String();
    final milliseconds = timeNow.millisecondsSinceEpoch;

    return "${method}_${pathValue}_${date}_$milliseconds";
  }
}

extension on Map<String, dynamic> {
  Map<String, dynamic> get filteredData {
    return Map.fromEntries(
      entries.where((element) => element.value != null).map((e) {
        return MapEntry(
          e.key,
          (e.value is Map<String, dynamic>)
              ? (e.value as Map<String, dynamic>).filteredData
              : (e.value is List<Map<String, dynamic>> &&
                    (e.value as List<Map<String, dynamic>>).isNotEmpty)
              ? (e.value as List<Map<String, dynamic>>)
                    .map((e) => e.filteredData)
                    .toList()
              : e.value,
        );
      }),
    );
  }
}
