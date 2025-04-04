import 'package:domain/model/localised_message.dart';

// error model that we expect to receive from API
class Failure {
  int code; // 200,201, 303, 404, 400, 500, 503 ...etc
  String message;

  Failure(this.code, this.message);
}
