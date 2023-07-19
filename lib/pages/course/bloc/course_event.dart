import 'package:edtech/common/entities/course.dart';

abstract class CourseEvents {
  const CourseEvents();
}

class TriggerCourseEvent extends CourseEvents {
  const TriggerCourseEvent(this.courseItem) : super();
  final CourseItem courseItem;
}
