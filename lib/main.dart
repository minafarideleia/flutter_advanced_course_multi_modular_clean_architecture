import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:navigator/navigation_module.dart';

import 'di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(Environment.dev);
  runApp(NavigationModule());
}
