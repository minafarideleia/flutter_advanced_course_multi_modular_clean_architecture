import 'package:app_settings/di/injection.dart';
import 'package:data/di/injection.dart';
import 'package:datastore/di/injection.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_advanced_course_multi_modular_clean_architecture/di/injection.config.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:login/data/di/injection.dart';
import 'package:movies/data/di/injection.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String? environment) async {
  Hive.initFlutter();
  await configureAppSettingsDependencies(getIt, environment);
  await configureDataStoreDependencies(getIt, environment);
  await configureCoreDataDependencies(getIt, environment);
  await configureLoginFeatureDependencies(getIt, environment);
  await configureMoviesFeatureDependencies(getIt, environment);
  getIt.init(environment: environment);
}
