import 'package:edtech/app_events.dart';
import 'package:edtech/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvents, AppState> {
  AppBloc() : super(InitStates()) {
    on<Increment>((event, emit) {
      print(state.counter);
      emit(AppState(counter: state.counter + 1));
    });
  }
}
