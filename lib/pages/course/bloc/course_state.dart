import 'package:edtech/common/entities/course.dart';

class CourseState {
  const CourseState({this.courseItem});

  final CourseItem? courseItem;

  CourseState copyWith({CourseItem? courseItem}) {
    return CourseState(courseItem: courseItem ?? this.courseItem);
  }
}
