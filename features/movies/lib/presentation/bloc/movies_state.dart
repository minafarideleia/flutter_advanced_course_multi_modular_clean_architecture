import 'package:equatable/equatable.dart';
import 'package:movies/domain/model/movie.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class MoviesState extends Equatable {
  final String? errorMessage;
  final StateRendererType stateRendererType;

  const MoviesState(
      {this.errorMessage,
      this.stateRendererType = StateRendererType.contentState});

  MoviesState copyWith(
      {String? errorMessage, StateRendererType? stateRenderType}) {
    return MoviesState(
        errorMessage: errorMessage, stateRendererType: stateRendererType);
  }

  @override
  List<Object?> get props => [errorMessage, stateRendererType];
}

// initial state
class MoviesInitial extends MoviesState {
  const MoviesInitial()
      : super(stateRendererType: StateRendererType.contentState);
}

// loading state
class MoviesLoading extends MoviesState {
  const MoviesLoading()
      : super(stateRendererType: StateRendererType.fullScreenLoadingState);
}

// loading state
class MoviesEmpty extends MoviesState {
  const MoviesEmpty()
      : super(stateRendererType: StateRendererType.emptyState);
}


// success state
class MoviesSuccess extends MoviesState {
  List<Movie> movies;

  MoviesSuccess({required this.movies})
      : super(stateRendererType: StateRendererType.contentState);
}

// error state
class MoviesError extends MoviesState {
  final String? errorMessage;

  const MoviesError({this.errorMessage})
      : super(
            errorMessage: errorMessage,
            stateRendererType: StateRendererType.fullScreenErrorState);
}
