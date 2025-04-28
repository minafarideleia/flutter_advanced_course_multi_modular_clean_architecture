import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/di/injection.config.dart'; // very very important to take care while generating injection.config.dart file

@InjectableInit()
Future<void> configureMoviesFeatureDependencies(
        GetIt getIt, String? environment) async =>
    getIt.init(environment: environment);
