import 'package:hive/hive.dart';
import 'package:movies/data/source/cache/movies_local_data_source.dart';
import 'package:movies/domain/model/cached_movie.dart';

class MoviesLocalDataSourceImpl implements MoviesLocalDataSource {
  static const _moviesCacheKey = 'moviesCacheKey';
  static const _cacheExpiryKey = 'cacheExpiryKey';
  static const _moviesCacheExpiryInSeconds = 60;
  final Box _box;

  MoviesLocalDataSourceImpl(this._box);

  @override
  Future<void> cacheMovies(List<CachedMovie> movies) async {
    await _box.put(_moviesCacheKey, movies);
    await _box.put(
        _cacheExpiryKey,
        DateTime.now()
            .add(const Duration(seconds: _moviesCacheExpiryInSeconds))
            .toIso8601String()); // 3:00 + 10 == 3:10 pm
  }

  @override
  Future<List<CachedMovie>> getMovies() async {
    return (_box.get(_moviesCacheKey, defaultValue: <CachedMovie>[]) as List)
        .cast<CachedMovie>();
  }

  @override
  Future<bool> hasValidCache() async {
    final cacheExpiryTimeString = _box.get(_cacheExpiryKey);
    if (cacheExpiryTimeString == null) return false;

    final cacheExpiryTime = DateTime.parse(cacheExpiryTimeString);
    // DateTime.now() => 3:11
    // cacheExpiryTime => 3:10
    return DateTime.now().isBefore(cacheExpiryTime);
  }
}
