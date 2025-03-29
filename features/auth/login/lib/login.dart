library;

import 'package:datastore/provider/SessionProvider.dart';
import 'package:datastore/provider/SessionProviderImpl.dart';
import 'package:dio/dio.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
  var session  = DevSessionProviderImpl();
  Dio dio = Dio();
}
