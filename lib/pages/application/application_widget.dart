import 'package:edtech/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import '../home/home_page.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    Center(
      child: Text("Search"),
    ),
    Center(
      child: Text("Course"),
    ),
    Center(
      child: Text("Chat"),
    ),
    ProfilePage(),
  ];

  return _widget[index];
}

var bottomTaps = [
  BottomNavigationBarItem(
    label: "Home",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: Image.asset(
      "assets/icons/home.png",
      width: 15.w,
      height: 15.w,
      color: AppColors.primaryElement,
    ),
  ),
  BottomNavigationBarItem(
    label: "Search",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/search2.png"),
    ),
    activeIcon: Image.asset(
      "assets/icons/search2.png",
      width: 15.w,
      height: 15.w,
      color: AppColors.primaryElement,
    ),
  ),
  BottomNavigationBarItem(
    label: "Course",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/play-circle1.png"),
    ),
    activeIcon: Image.asset(
      "assets/icons/play-circle1.png",
      width: 15.w,
      height: 15.w,
      color: AppColors.primaryElement,
    ),
  ),
  BottomNavigationBarItem(
    label: "Chat",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
    activeIcon: Image.asset(
      "assets/icons/message-circle.png",
      width: 15.w,
      height: 15.w,
      color: AppColors.primaryElement,
    ),
  ),
  BottomNavigationBarItem(
    label: "Profile",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/person2.png"),
    ),
    activeIcon: Image.asset(
      "assets/icons/person2.png",
      width: 15.w,
      height: 15.w,
      color: AppColors.primaryElement,
    ),
  ),
];
