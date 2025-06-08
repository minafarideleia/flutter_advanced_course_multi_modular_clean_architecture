import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:movies/domain/mapper/movies_mapper.dart';
import 'package:movies/domain/model/movie.dart';
import 'package:movies/domain/repository/movies_repository.dart';

import '../source/cache/movies_local_data_source.dart';
import '../source/remote/movies_remote_data_source.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDataSource;
  final MoviesLocalDataSource moviesLocalDataSource;

  MoviesRepositoryImpl(this.moviesRemoteDataSource, this.moviesLocalDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getMovies() async {
    final result = await moviesRemoteDataSource.getMovies();
    return result.fold(
        (failure) => Left(failure), (response) => Right(response.toDomain()));
  }
}
