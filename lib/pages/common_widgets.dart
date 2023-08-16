import 'package:edtech/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/widgets/dialog.dart';

AppBar buildAppBar(String type) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        height: 1.0,
        color: AppColors.primarySecondaryBackground,
      ),
    ),
    centerTitle: true,
    // elevation: 0,
    backgroundColor: Colors.white,
    title: Text(
      type,
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}

// we need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 50.w, right: 50.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
            onTap: () {
              print('hessrr');
              showDialogueBox(context, 'Coming Soon', 'Social Login');
            },
            child: _reusableIcons("google", context)),
        GestureDetector(
            onTap: () {
              return showDialogueBox(context, 'Coming Soon', 'Social Login');
            },
            child: _reusableIcons("apple", context)),
        GestureDetector(
            onTap: () {
              return showDialogueBox(context, 'Coming Soon', 'Social Login');
            },
            child: _reusableIcons("facebook", context))
      ],
    ),
  );
}

Widget _reusableIcons(String iconName, context) {
  return GestureDetector(
    onTap: () {
      showDialogueBox(context, 'Coming soon', 'Social login');
    },
    child: SizedBox(
      height: 48.w,
      width: 48.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)? func) {
  return Container(
    width: 325.w,
    height: 58.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.primaryFourthElementText)),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          height: 16.w,
          width: 16.w,
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        Container(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintStyle: const TextStyle(
                    color: AppColors.primarySecondaryElementText)),
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avanir",
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
            obscureText: textType == "password" ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(left: 25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot password,",
        style: TextStyle(
            color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            fontSize: 12.sp,
            decorationColor: AppColors.primaryText),
      ),
    ),
  );
}

Widget buildLoginAndRegBtn(
    String buttonName, buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(
          left: 25.w, right: 25.w, top: buttonType == 'login' ? 20.h : 10.h),
      width: 325.w,
      height: 58.h,
      decoration: BoxDecoration(
          color: buttonType == 'login'
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
              // check for registration button border color
              color: buttonType == 'login'
                  ? Colors.transparent
                  : AppColors.primaryFourthElementText),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonType == 'login'
                ? AppColors.primaryBackground
                : AppColors.primaryText),
      )),
    ),
  );
}
