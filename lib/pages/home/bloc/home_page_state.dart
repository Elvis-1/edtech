import 'package:edtech/common/entities/course.dart';

class HomePageStates {
  const HomePageStates(
      {this.index = 0, this.courseItem = const <CourseItem>[]});

  final int index;
  final List<CourseItem> courseItem;

  HomePageStates copyWith({int? index, List<CourseItem>? courseItem}) {
    return HomePageStates(
      index: index ?? this.index,
      courseItem: courseItem ?? this.courseItem,
    );
  }
}
