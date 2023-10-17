import 'package:edtech/common/entities/entities.dart';
import 'package:edtech/global.dart';
import 'package:edtech/pages/home/bloc/home_page_bloc.dart';
import 'package:edtech/pages/home/bloc/home_page_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/apis/course_api.dart';

class HomeController {
  //late final BuildContext context;
  BuildContext? context;
  UserItem get userProfile => Global.storageService.getUserProfile();

  // home controller is making api calls every time a button is clicked, lets make it a singleton. To create a singleton, in general you create a private contructor

  static final _singleton = HomeController._external();

  HomeController._external();

  // this is a factory contructor
  // makes sure you have the original only one instance
  factory HomeController({required context}) {
    _singleton.context = context;
    return _singleton;
  }

  Future<void> init() async {
    if (Global.storageService.getUserToken().isNotEmpty) {
      print("... home init method...");
      var result = await CourseApi().courseList();

      if (result.code == 200) {
        if (context!.mounted) {
          context!
              .read<HomePageBlocs>()
              .add(HomePageCourseItemEvent(result.data!));
          return;
        }
      } else {
        print(result.code);
        return;
      }
    } else {
      print("User has already logged in");
    }
    return;
  }
}
