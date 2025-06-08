import 'package:movies/domain/model/cached_movie.dart';

abstract class MoviesCacheDataSource {
  Future<List<CachedMovie>> getMovies();

  Future<void> cacheMovies(List<CachedMovie> movies);

  Future<bool> hasValidCache();
}
