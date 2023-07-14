import 'package:edtech/common/entities/entities.dart';
import 'package:edtech/global.dart';
import 'package:edtech/pages/home/bloc/home_page_bloc.dart';
import 'package:edtech/pages/home/bloc/home_page_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/apis/course_api.dart';

class HomeController {
  final BuildContext context;
  HomeController({required this.context});

  UserItem? userProfile = Global.storageService.getUserProfile();

  void init() async {
    print("... home init method...");
    var result = await CourseApi().courseList();

    if (result.code == 200) {
      context.read<HomePageBlocs>().add(HomePageCourseItemEvent(result.data!));
      print("Perfect");
      print(result.data![0].name);
    } else {
      print(result.code);
    }
  }
}
