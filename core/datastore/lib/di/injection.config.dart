// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:datastore/provider/session/session_provider.dart' as _i1014;
import 'package:datastore/provider/session/session_provider_impl.dart' as _i385;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
    gh.factory<_i1014.SessionProvider>(
      () => _i385.DevSessionProviderImpl(gh<_i460.SharedPreferences>()),
      registerFor: {_dev},
    );
    gh.factory<_i1014.SessionProvider>(
      () => _i385.ProdSessionProviderImpl(gh<_i460.SharedPreferences>()),
      registerFor: {_prod},
    );
    return this;
  }
}
