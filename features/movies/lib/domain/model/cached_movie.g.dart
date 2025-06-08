// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedMovieAdapter extends TypeAdapter<CachedMovie> {
  @override
  final int typeId = 1;

  @override
  CachedMovie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedMovie(
      id: fields[0] as String,
      originalTitle: fields[1] as String,
      overview: fields[2] as String,
      posterPath: fields[3] as String,
      releaseDate: fields[4] as String,
      title: fields[5] as String,
      voteAverage: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CachedMovie obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.originalTitle)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedMovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
