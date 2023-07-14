import 'package:edtech/common/entities/course.dart';
import 'package:edtech/common/utils/http_util.dart';

class CourseApi {
  Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().postData('api/courseList');

    return CourseListResponseEntity.fromJson(response);
  }
}
