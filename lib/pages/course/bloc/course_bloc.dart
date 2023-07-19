import 'package:edtech/pages/course/bloc/course_event.dart';
import 'package:edtech/pages/course/bloc/course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseBloc extends Bloc<CourseEvents, CourseState> {
  CourseBloc() : super(const CourseState()) {
    on<TriggerCourseEvent>(_triggerCourse);
  }

  void _triggerCourse(TriggerCourseEvent event, Emitter<CourseState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
