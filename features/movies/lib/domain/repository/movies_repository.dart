import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';

import '../model/movie.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getMovies();
}
