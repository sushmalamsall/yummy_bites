import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yummy_bites/common/services/setup_custom_bottomsheets.dart';
import 'package:yummy_bites/common/services/setup_custom_snackbars.dart';
import 'package:yummy_bites/routes/app_routes.dart';
import 'injection.config.dart';

final injection = GetIt.instance;

Future configureDependencies() async {
  _configureInjection();

  injection.registerSingleton<AppRouter>(
    AppRouter(navigatorKey: StackedService.navigatorKey),
  );
  setupCustomSnackBars();
  setupBottomSheets();
}

@InjectableInit()
_configureInjection() => injection.init();
