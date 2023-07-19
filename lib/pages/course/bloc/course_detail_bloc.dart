import 'package:edtech/pages/course/bloc/course_detail_event.dart';
import 'package:edtech/pages/course/bloc/course_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsBloc extends Bloc<CourseDetailEvents, CourseDetailsState> {
  CourseDetailsBloc() : super(const CourseDetailsState()) {
    on<TriggerCourseDetailEvent>(_triggerCourseDetail);
  }

  void _triggerCourseDetail(
      TriggerCourseDetailEvent event, Emitter<CourseDetailsState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
