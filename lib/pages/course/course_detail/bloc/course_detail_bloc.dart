import 'package:flutter_bloc/flutter_bloc.dart';

import 'course_detail_event.dart';
import 'course_detail_state.dart';

class CourseDetailsBloc extends Bloc<CourseDetailEvents, CourseDetailsState> {
  CourseDetailsBloc() : super(const CourseDetailsState()) {
    on<TriggerCourseDetailEvent>(_triggerCourseDetail);
    on<TriggerLessonListEvent>(_triggerLessonList);
  }

  void _triggerCourseDetail(
      TriggerCourseDetailEvent event, Emitter<CourseDetailsState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }

  void _triggerLessonList(
      TriggerLessonListEvent event, Emitter<CourseDetailsState> emit) {
    emit(state.copyWith(lessonItem: event.lessonItem));
  }
}
