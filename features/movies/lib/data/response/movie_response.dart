import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "original_title")
  String? originalTitle;

  @JsonKey(name: "overview")
  String? overview;

  @JsonKey(name: "poster_path")
  String? posterPath;

  @JsonKey(name: "release_date")
  String? releaseDate;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "vote_average")
  String? voteAverage;


  MovieResponse(this.id, this.originalTitle, this.overview, this.posterPath,
      this.releaseDate, this.title, this.voteAverage);

  // from json

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

// to json

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);

}
