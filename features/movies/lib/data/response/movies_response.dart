import 'package:json_annotation/json_annotation.dart';

import 'movie_response.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse {
  @JsonKey(name: "movies")
  List<MovieResponse>? movies;

  MoviesResponse(this.movies);

  // from json

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

// to json

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}
