import 'package:edtech/common/apis/course_api.dart';
import 'package:edtech/common/entities/course.dart';
import 'package:edtech/common/widgets/flutter_toast.dart';
import 'package:edtech/pages/course/course_detail/bloc/course_detail_bloc.dart';
import 'package:edtech/pages/course/course_detail/bloc/course_detail_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}
