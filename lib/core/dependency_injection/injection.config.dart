// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:stacked_services/stacked_services.dart' as _i1055;
import 'package:yummy_bites/core/dependency_injection/third_party_module.dart'
    as _i350;
import 'package:yummy_bites/core/services/toast_service.dart' as _i163;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyModule = _$ThirdPartyModule();
    gh.lazySingleton<_i1055.NavigationService>(
      () => thirdPartyModule.navigationService,
    );
    gh.lazySingleton<_i1055.DialogService>(
      () => thirdPartyModule.dialogService,
    );
    gh.lazySingleton<_i1055.SnackbarService>(
      () => thirdPartyModule.snackBarService,
    );
    gh.lazySingleton<_i1055.BottomSheetService>(
      () => thirdPartyModule.bottomSheetService,
    );
    gh.lazySingleton<_i361.Dio>(() => thirdPartyModule.dio);
    gh.factory<_i163.ToastService>(
      () => _i163.ToastService(gh<_i1055.SnackbarService>()),
    );
    return this;
  }
}

class _$ThirdPartyModule extends _i350.ThirdPartyModule {
  @override
  _i1055.NavigationService get navigationService => _i1055.NavigationService();

  @override
  _i1055.DialogService get dialogService => _i1055.DialogService();

  @override
  _i1055.SnackbarService get snackBarService => _i1055.SnackbarService();

  @override
  _i1055.BottomSheetService get bottomSheetService =>
      _i1055.BottomSheetService();
}
