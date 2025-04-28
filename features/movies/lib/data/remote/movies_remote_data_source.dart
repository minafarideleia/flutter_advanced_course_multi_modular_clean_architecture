import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:movies/data/response/movies_response.dart';

abstract class MoviesRemoteDataSource {
  Future<Either<Failure, MoviesResponse>> getMovies();
}
