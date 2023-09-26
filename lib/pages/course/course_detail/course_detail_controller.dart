import 'package:edtech/common/apis/course_api.dart';
import 'package:edtech/common/entities/course.dart';
import 'package:edtech/common/routes/names.dart';
import 'package:edtech/common/widgets/dialog.dart';
import 'package:edtech/common/widgets/flutter_toast.dart';
import 'package:edtech/pages/course/course_detail/bloc/course_detail_bloc.dart';
import 'package:edtech/pages/course/course_detail/bloc/course_detail_event.dart';
import 'package:edtech/pages/course/paywebview/bloc/payview_bloc.dart';
import 'package:edtech/pages/course/paywebview/bloc/payview_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CourseDetailController {
  final BuildContext context;
  CourseDetailController({required this.context});

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    asyncLoadAllData(args["id"]);
  }

  asyncLoadAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;

    var result = await CourseApi().courseDetail(params: courseRequestEntity);

    if (result.code == 200) {
      if (context.mounted) {
        print(result.data!.description.toString());
        context
            .read<CourseDetailsBloc>()
            .add(TriggerCourseDetailEvent(result.data!));
      } else {
        print("Context not available");
      }
    } else {
      toastInfo(msg: "Something went wrong");
      print("------------ Error ${result.data}");
    }
  }

  void goBuy(int? id) async {
    EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);

    CourseRequestEntity courseRequestEntity = CourseRequestEntity();

    courseRequestEntity.id = id;
    var result = await CourseApi.coursePay(params: courseRequestEntity);

    EasyLoading.dismiss();
    if (result.code == 200) {
      // cleaner format of a url
      var url = Uri.decodeFull(result.data!);
      var res = await Navigator.of(context)
          .pushNamed(AppRoutes.PAY_WEB_VIEW, arguments: {"url": url});
      // print("-- my returned stripe url is $url ---------");

      if (res == 'success') {
        toastInfo(msg: 'You bought it successfully');
      }
    } else {
      showDialogueBox(context, result.msg!, 'Order');
      print("Payment failed");
      toastInfo(msg: result.msg!);
    }
  }
}
