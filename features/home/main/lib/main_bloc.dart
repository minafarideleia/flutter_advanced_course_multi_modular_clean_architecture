import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main/main_event.dart';
import 'package:main/main_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenState(0)) {
    on<ChangeTab>((event, emit) {
      emit(MainScreenState(event.index));
    });
  }
}
