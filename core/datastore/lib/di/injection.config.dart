// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:datastore/provider/SessionProvider.dart' as _i16;
import 'package:datastore/provider/SessionProviderImpl.dart' as _i644;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

const String _dev = 'dev';
const String _prod = 'prod';

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
    gh.factory<_i16.SessionProvider>(
      () => _i644.DevSessionProviderImpl(),
      registerFor: {_dev},
    );
    gh.factory<_i16.SessionProvider>(
      () => _i644.ProdSessionProviderImpl(),
      registerFor: {_prod},
    );
    return this;
  }
}
