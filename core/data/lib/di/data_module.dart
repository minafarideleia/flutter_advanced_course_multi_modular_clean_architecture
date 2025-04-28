import 'package:data/factory/dio_factory.dart';
import 'package:datastore/provider/preferences/preferences_provider.dart';
import 'package:datastore/provider/session/session_provider.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../network_info/network_info.dart';
import '../network_info/network_info_impl.dart';
import 'data_module_keys.dart';

@module
abstract class DataModule {
  @lazySingleton
  NetworkInfo provideNetworkInfo() => NetworkInfoImpl();

  // provide base url
  @Named(DataModuleKeys.baseUrl) // a tag for this string
  String provideBaseUrl(PreferencesProvider preferencesProvider) =>
      preferencesProvider.getBaseUrl();

  @Named(DataModuleKeys.accessToken) // a tag for this string
  String provideAccessToken(SessionProvider sessionProvider) =>
      sessionProvider.getAccessToken();

  @Named(DataModuleKeys.language) // a tag for this string
  String provideLanguage(PreferencesProvider preferencesProvider) =>
      preferencesProvider.getAppLanguage();

  @lazySingleton
  Dio dio(
      @Named(DataModuleKeys.baseUrl) String baseUrl,
      @Named(DataModuleKeys.accessToken) String accessToken,
      @Named(DataModuleKeys.language) String language) {
    final dioFactory = DioFactory(
        baseUrl: baseUrl, accessToken: accessToken, language: language);

    return dioFactory.getDio();
  }
}
