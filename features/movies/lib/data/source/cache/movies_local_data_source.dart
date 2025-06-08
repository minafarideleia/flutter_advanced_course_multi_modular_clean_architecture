import 'package:movies/domain/model/cached_movie.dart';

abstract class MoviesLocalDataSource {
  Future<List<CachedMovie>> getMovies();

  Future<void> cacheMovies(List<CachedMovie> movies);

  Future<bool> hasValidCache();
}
