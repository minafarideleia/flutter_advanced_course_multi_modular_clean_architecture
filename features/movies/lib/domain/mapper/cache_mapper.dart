import 'package:movies/domain/model/cached_movie.dart';
import 'package:movies/domain/model/movie.dart';

extension CacheToMovieMapper on CachedMovie {
  Movie toDomain() {
    return Movie(
        id: id,
        originalTitle: originalTitle,
        overview: overview,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        voteAverage: voteAverage);
  }
}

extension MovieToCacheMapper on Movie {
  CachedMovie toDomain() {
    return CachedMovie(
        id: id,
        originalTitle: originalTitle,
        overview: overview,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        voteAverage: voteAverage);
  }
}
