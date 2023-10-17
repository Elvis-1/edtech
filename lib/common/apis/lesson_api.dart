import 'package:edtech/common/entities/base.dart';
import 'package:edtech/common/entities/course.dart';
import 'package:edtech/common/entities/entities.dart';
import 'package:edtech/common/utils/http_util.dart';

class LessonApi {
  static Future<LessonListResponseEntity> lessonList(
      {LessonRequestEntity? params}) async {
    var response = await HttpUtil()
        .postData('api/lessonList', queryParameters: params?.toJson());

    return LessonListResponseEntity.fromJson(response);
  }

  static Future<LessonDetailResponseEntity> lessonDetail(
      {LessonRequestEntity? params}) async {
    var response = await HttpUtil()
        .postData('api/lessonDetail', queryParameters: params?.toJson());

    return LessonDetailResponseEntity.fromJson(response);
  }
}
