import 'package:edtech/common/entities/course.dart';

abstract class HomePageEvents {
  const HomePageEvents();
}

class HomePageDots extends HomePageEvents {
  final int index;
  HomePageDots(this.index);
}

class HomePageCourseItemEvent extends HomePageEvents {
  const HomePageCourseItemEvent(this.courseItem);
  final List<CourseItem>? courseItem;
}
