

import 'package:get_it/get_it.dart';
import 'package:flutter_advanced_course_multi_modular_clean_architecture/di/injection.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();