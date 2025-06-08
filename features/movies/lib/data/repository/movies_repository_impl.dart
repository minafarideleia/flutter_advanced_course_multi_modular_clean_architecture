import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:movies/domain/mapper/cache_mapper.dart';
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
    if (await moviesLocalDataSource.hasValidCache()) {
      // fetch from the cache
      final cachedMovies = await moviesLocalDataSource.getMovies();
      return Right(
          cachedMovies.map((cachedMovie) => cachedMovie.toMovie()).toList());
    } else {
      // fetch from server
      final result = await moviesRemoteDataSource.getMovies();

      return await result.fold((failure) {
        return Left(failure);
      }, (response) async {
        await moviesLocalDataSource.cacheMovies(response.movies!
            .map((movieResponse) => movieResponse.toDomain().toCachedMovie())
            .toList());
        return Right(response.toDomain());
      });
    }
  }
}
