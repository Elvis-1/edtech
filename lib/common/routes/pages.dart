import 'package:edtech/common/routes/names.dart';
import 'package:edtech/pages/application/application_page.dart';
import 'package:edtech/pages/application/bloc/app_bloc.dart';
import 'package:edtech/pages/course/bloc/course_detail_bloc.dart';
import 'package:edtech/pages/course/course_detail_page.dart';
import 'package:edtech/pages/home/bloc/home_page_bloc.dart';
import 'package:edtech/pages/home/home_page.dart';
import 'package:edtech/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:edtech/pages/profile/settings/settings_page.dart';
import 'package:edtech/pages/register/blocs/register_blocs.dart';
import 'package:edtech/pages/register/register.dart';
import 'package:edtech/pages/sign%20in/bloc/signin_bloc.dart';
import 'package:edtech/pages/sign%20in/signin.dart';
import 'package:edtech/pages/welcome/bloc/welcom_block.dart';
import 'package:edtech/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(create: (_) => RegisterBloc())),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(create: (_) => AppBlocs())),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(create: (_) => HomePageBlocs())),
      PageEntity(
          route: AppRoutes.SETTINGS,
          page: const SettingsPage(),
          bloc: BlocProvider(create: (_) => SettingsBloc())),
      PageEntity(
          route: AppRoutes.COURSE_DETAILS_PAGE,
          page: const CourseDetailPage(),
          bloc: BlocProvider(create: (_) => CourseDetailsBloc()))
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

// a model that covers the entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // print("valid route name ${settings.name}");
      // check for route name matching when navigator get triggered
      var result = routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedin();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }

    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

// unify Bloc Provider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
