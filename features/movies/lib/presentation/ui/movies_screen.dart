import 'package:flutter/material.dart';
import 'package:flutter_advanced_course_multi_modular_clean_architecture/di/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/bloc/movies_bloc.dart';
import 'package:movies/presentation/bloc/movies_event.dart';
import 'package:movies/presentation/ui/movie_card.dart';
import 'package:presentation/state_renderer/state_renderer.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

import '../../domain/usecase/movies_usecase.dart';
import '../bloc/movies_state.dart';

class MoviesScreen extends StatelessWidget {
  final moviesUseCase = getIt<MoviesUseCase>();

  MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // schedule a callback after the first time rendering of the screen to load movies

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // check if the current state is the initial state to avoid re-dispatching
      final currentState = context.read<MoviesBloc>().state;
      if (currentState is MoviesInitial) {
        context.read<MoviesBloc>().add(MoviesGetter());
      }
    });

    return Scaffold(
      body: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
        return Stack(
          children: [
            if (state is MoviesSuccess) _buildMainScreenContent(context, state),
            _buildStateRenderer(context, state)
          ],
        );
      }),
    );
  }

  Widget _buildMainScreenContent(BuildContext context, MoviesSuccess state) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: GridView.builder(
          itemCount: state.movies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            return MovieCard(state.movies[index]);
          }),
    );
  }

  Widget _buildStateRenderer(BuildContext context, MoviesState state) {
    return StateRenderer(
      stateRendererType: state.stateRendererType,
      message: (state is MoviesError) ? state.errorMessage ?? "" : "",
      retryActionFunction: () {
        // load movies on click retry button
        context.read<MoviesBloc>().add(MoviesGetter());
      },
    );
  }
}
