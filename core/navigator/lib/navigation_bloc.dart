import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigator/navigation_event.dart';
import 'package:navigator/navigation_routes.dart';
import 'package:navigator/navigation_state.dart';
import 'package:navigator/navigation_types.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState("", NavigationType.push)) {
    on<NavigateToHome>((event, emit) {
      emit(NavigationState(NavigationRoutes.home, NavigationType.replace));
    });

    on<NavigateToLogin>((event, emit) {
      emit(NavigationState(NavigationRoutes.login, NavigationType.replace));
    });

    // custom event to route
    on<NavigateToRoute>((event, emit) {
      emit(NavigationState(event.route, event.navigationType));
    });
  }
}
