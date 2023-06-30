import 'package:edtech/pages/application/bloc/app_bloc.dart';
import 'package:edtech/pages/application/bloc/app_events.dart';
import 'package:edtech/pages/application/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import 'application_widget.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppStates>(builder: (context, state) {
      return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
                  body: buildPage(state.index),
                  bottomNavigationBar: Container(
                    width: 375.w,
                    height: 58.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28.h),
                            topRight: Radius.circular(28.h)),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 1,
                            color: Colors.grey.withOpacity(0.1),
                          )
                        ]),
                    child: BottomNavigationBar(
                        elevation: 0,
                        currentIndex: state.index,
                        type: BottomNavigationBarType.fixed,
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        selectedItemColor: AppColors.primaryElement,
                        unselectedItemColor: AppColors.primaryFourthElementText,
                        onTap: (value) {
                          context.read<AppBlocs>().add(TriggerAppEvent(value));
                        },
                        items: bottomTaps),
                  ))));
    });
  }
}
