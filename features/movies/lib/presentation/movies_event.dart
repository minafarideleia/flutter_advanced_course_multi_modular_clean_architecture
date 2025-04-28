import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object?> get props => [];
}

// one event to get movies.
class MoviesGetter extends MoviesEvent {
  const MoviesGetter();

  @override
  List<Object?> get props => [];
}
