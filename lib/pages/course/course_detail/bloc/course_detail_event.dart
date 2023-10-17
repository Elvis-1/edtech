import 'package:edtech/common/entities/course.dart';
import 'package:edtech/common/entities/lesson.dart';

abstract class CourseDetailEvents {
  const CourseDetailEvents();
}

class TriggerCourseDetailEvent extends CourseDetailEvents {
  const TriggerCourseDetailEvent(this.courseItem) : super();
  final CourseItem courseItem;
}

class TriggerLessonListEvent extends CourseDetailEvents {
  const TriggerLessonListEvent(this.lessonItem) : super();
  final List<LessonItem> lessonItem;
}
