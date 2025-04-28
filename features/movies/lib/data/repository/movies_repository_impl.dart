import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:movies/data/remote/movies_remote_data_source.dart';
import 'package:movies/domain/mapper/movies_mapper.dart';
import 'package:movies/domain/model/movie.dart';
import 'package:movies/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDataSource;

  MoviesRepositoryImpl(this.moviesRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getMovies() async {
    final result = await moviesRemoteDataSource.getMovies();
    return result.fold(
        (failure) => Left(failure), (response) => Right(response.toDomain()));
  }
}
