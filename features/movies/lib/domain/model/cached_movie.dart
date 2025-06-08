import 'package:hive/hive.dart';

part 'cached_movie.g.dart';

@HiveType(typeId: 1)
class CachedMovie {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String originalTitle;
  @HiveField(2)
  final String overview;
  @HiveField(3)
  final String posterPath;
  @HiveField(4)
  final String releaseDate;
  @HiveField(5)
  final String title;
  @HiveField(6)
  final String voteAverage;

  CachedMovie(
      {required this.id,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.voteAverage});
}