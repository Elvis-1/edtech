import 'package:edtech/common/entities/course.dart';
import 'package:edtech/common/entities/entities.dart';

class CourseDetailsState {
  const CourseDetailsState(
      {this.courseItem, this.lessonItem = const <LessonItem>[]});

  final CourseItem? courseItem;
  final List<LessonItem> lessonItem;

  CourseDetailsState copyWith(
      {CourseItem? courseItem, List<LessonItem>? lessonItem}) {
    return CourseDetailsState(
        courseItem: courseItem ?? this.courseItem,
        lessonItem: lessonItem ?? this.lessonItem);
  }
}
