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
import 'package:movies/data/di/movies_module.dart' as _i442;
import 'package:movies/data/remote/movies_remote_data_source.dart' as _i835;
import 'package:movies/data/service/movies_service.dart' as _i809;
import 'package:movies/domain/repository/movies_repository.dart' as _i591;
import 'package:movies/domain/usecase/movies_usecase.dart' as _i365;

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
    final moviesModule = _$MoviesModule();
    gh.lazySingleton<_i809.MoviesService>(
        () => moviesModule.provideMoviesService(gh<_i361.Dio>()));
    gh.lazySingleton<_i835.MoviesRemoteDataSource>(
        () => moviesModule.provideMoviesRemoteDataSource(
              gh<_i809.MoviesService>(),
              gh<_i131.NetworkInfo>(),
            ));
    gh.lazySingleton<_i591.MoviesRepository>(() => moviesModule
        .provideMoviesRepository(gh<_i835.MoviesRemoteDataSource>()));
    gh.lazySingleton<_i365.MoviesUseCase>(
        () => moviesModule.provideMoviesUseCase(gh<_i591.MoviesRepository>()));
    return this;
  }
}

class _$MoviesModule extends _i442.MoviesModule {}
