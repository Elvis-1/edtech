import 'package:edtech/common/entities/base.dart';
import 'package:edtech/common/entities/course.dart';
import 'package:edtech/common/utils/http_util.dart';

class CourseApi {
  Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().postData('api/courseList');
    print(response);
    return CourseListResponseEntity.fromJson(response);
  }

  Future<CourseDetailResponseEntity> courseDetail(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil()
        .postData('api/courseDetail', queryParameters: params?.toJson());

    return CourseDetailResponseEntity.fromJson(response);
  }

  // for course payment
  static Future<BaseResponseEntity> coursePay(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil()
        .postData('api/checkout', queryParameters: params?.toJson());

    return BaseResponseEntity.fromJson(response);
  }
}
