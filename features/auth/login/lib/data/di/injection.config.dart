// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/network_info/network_info.dart' as _i131;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:login/data/di/login_module.dart' as _i802;
import 'package:login/data/remote/login_remote_data_source.dart' as _i286;
import 'package:login/data/service/login_service.dart' as _i762;
import 'package:login/domain/repository/login_repository.dart' as _i839;
import 'package:login/domain/usecase/login_usecase.dart' as _i824;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final loginModule = _$LoginModule();
    gh.lazySingleton<_i131.NetworkInfo>(() => loginModule.provideNetworkInfo());
    gh.lazySingleton<_i762.LoginService>(
        () => loginModule.provideLoginService(gh<_i361.Dio>()));
    gh.lazySingleton<_i286.LoginRemoteDataSource>(
        () => loginModule.provideLoginRemoteDataSource(
              gh<_i762.LoginService>(),
              gh<_i131.NetworkInfo>(),
            ));
    gh.lazySingleton<_i839.LoginRepository>(() =>
        loginModule.provideLoginRepository(gh<_i286.LoginRemoteDataSource>()));
    gh.lazySingleton<_i824.LoginUseCase>(
        () => loginModule.provideLoginUseCase(gh<_i839.LoginRepository>()));
    return this;
  }
}

class _$LoginModule extends _i802.LoginModule {}
