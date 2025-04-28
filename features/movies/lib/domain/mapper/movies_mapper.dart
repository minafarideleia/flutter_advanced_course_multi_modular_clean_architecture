import 'package:extensions/constant/constant.dart';
import 'package:extensions/extensions.dart';
import 'package:movies/data/response/movie_response.dart';
import 'package:movies/domain/model/movie.dart';

import '../../data/response/movies_response.dart';

extension MovieResponseMapper on MovieResponse? {
  Movie toDomain() {
    return Movie(
        id: this?.id.orEmpty() ?? Constants.empty,
        originalTitle: this?.originalTitle.orEmpty() ?? Constants.empty,
        overview: this?.overview.orEmpty() ?? Constants.empty,
        posterPath: this?.posterPath.orEmpty() ?? Constants.empty,
        releaseDate: this?.releaseDate.orEmpty() ?? Constants.empty,
        title: this?.title.orEmpty() ?? Constants.empty,
        voteAverage: this?.voteAverage.orEmpty() ?? Constants.empty);
  }
}

extension MoviesResponseMapper on MoviesResponse? {
  List<Movie> toDomain() {
    List<Movie> movies =
        (this?.movies?.map((movieResponse) => movieResponse.toDomain()) ??
                const Iterable.empty())
            .cast<Movie>()
            .toList();

    return movies;
  }
}
