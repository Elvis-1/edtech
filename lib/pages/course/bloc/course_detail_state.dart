import 'package:edtech/common/entities/course.dart';

class CourseDetailsState {
  const CourseDetailsState({this.courseItem});

  final CourseItem? courseItem;

  CourseDetailsState copyWith({CourseItem? courseItem}) {
    return CourseDetailsState(courseItem: courseItem ?? this.courseItem);
  }
}
