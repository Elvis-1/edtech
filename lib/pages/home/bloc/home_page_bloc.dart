import 'package:edtech/pages/home/bloc/home_page_event.dart';
import 'package:edtech/pages/home/bloc/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBlocs() : super(const HomePageStates()) {
    on<HomePageDots>(_homePageDots);
    on<HomePageCourseItemEvent>(_homePageCourseItem);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(index: event.index));
  }

  void _homePageCourseItem(
      HomePageCourseItemEvent event, Emitter<HomePageStates> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
