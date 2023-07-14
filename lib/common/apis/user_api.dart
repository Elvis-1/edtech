import 'package:edtech/common/entities/entities.dart';

import '../utils/http_util.dart';

class UserAPI {
  static login({LoginRequestEntity? params}) async {
    var response = await HttpUtil()
        .postData('api/auth/login', queryParameters: params?.toJson());

    return UserLoginResponseEntity.fromJson(response);
  }
}
