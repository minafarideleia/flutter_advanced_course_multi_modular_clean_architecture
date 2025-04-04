import 'package:data/factory/dio_factory.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  // provide base url
  @Named("BaseUrl") // a tag for this string
  String get baseUrl => "base_url";

  @Named("AccessToken") // a tag for this string
  Future<String> get accessToken async {
    // return access token
  }

  @Named("Language") // a tag for this string
  Future<String> get language async {
    // return language
  }

  @lazySingleton
  Future<Dio> dio(
      @Named("BaseUrl") String baseUrl,
      @Named("AccessToken") Future<String> accessToken,
      @Named("Language") Future<String> language) async {
    final dioFactory = DioFactory(
        baseUrl: baseUrl,
        accessToken: await accessToken,
        language: await language);

    return dioFactory.getDio();
  }


}
