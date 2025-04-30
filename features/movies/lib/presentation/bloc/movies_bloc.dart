import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/usecase/movies_usecase.dart';

import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesUseCase moviesUseCase;

  MoviesBloc(this.moviesUseCase) : super(const MoviesInitial()) {
    on<MoviesGetter>(_onMoviesGetter);
  }

  Future<void> _onMoviesGetter(
      MoviesGetter event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());

    final result = await moviesUseCase.execute("");

    result.fold((failure) {
      // emit error
      emit(MoviesError(errorMessage: failure.message));
    }, (movies) {
      // emit success
      print("Movies Success: ${movies.length}");
      if (movies.isEmpty) {
        emit(MoviesEmpty());
      } else {
        emit(MoviesSuccess(movies: movies));
      }
    });
  }
}
