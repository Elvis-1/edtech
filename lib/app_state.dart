class AppState {
  AppState({required this.counter});
  int counter;
}

class InitStates extends AppState {
  InitStates() : super(counter: -2);
}
