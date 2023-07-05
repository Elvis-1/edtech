class HomePageStates {
  const HomePageStates({this.index = 0});
  final int index;

  HomePageStates copyWith({int? index}) {
    return HomePageStates(index: index ?? this.index);
  }
}
