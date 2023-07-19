import 'package:edtech/common/entities/course.dart';

abstract class CourseDetailEvents {
  const CourseDetailEvents();
}

class TriggerCourseDetailEvent extends CourseDetailEvents {
  const TriggerCourseDetailEvent(this.courseItem) : super();
  final CourseItem courseItem;
}
