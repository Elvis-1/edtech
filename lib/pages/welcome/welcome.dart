import 'package:dots_indicator/dots_indicator.dart';
import 'package:edtech/main.dart';
import 'package:edtech/pages/welcome/bloc/welcom_block.dart';
import 'package:edtech/pages/welcome/bloc/welcome_event.dart';
import 'package:edtech/pages/welcome/bloc/welcome_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          body: BlocBuilder<WelcomeBloc, WelcomeState>(
              builder: (context, state) => Container(
                    margin: EdgeInsets.only(top: 34.h),
                    width: 375.w,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        PageView(
                          controller: pageController,
                          onPageChanged: (index) {
                            print("index value is ${index}");
                            state.page = index;
                            BlocProvider.of<WelcomeBloc>(context)
                                .add(WelcomeEvents());
                          },
                          children: [
                            _page(
                                1,
                                context,
                                "Next",
                                "First See Learning",
                                "Forge about a far of paper all knowlegde in one place  learning",
                                "assets/images/reading.png"),
                            _page(
                                2,
                                context,
                                "Next",
                                "Connect With Everyone",
                                "Always keep in touch with you tutor and frienc. Lets get connnected",
                                "assets/images/boy.png"),
                            _page(
                                3,
                                context,
                                "Get Started",
                                "Always fascinated Learning",
                                "Anywhere, anytime. The time is at our discretion, so study whenever you want",
                                "assets/images/man.png"),
                          ],
                        ),
                        Positioned(
                            bottom: 100.h,
                            child: DotsIndicator(
                              position: state.page,
                              dotsCount: 3,
                              mainAxisAlignment: MainAxisAlignment.center,
                              decorator: DotsDecorator(
                                  color: Colors.grey,
                                  size: Size.square(8.0),
                                  activeColor: Colors.blue,
                                  activeSize: Size(18.0, 8.0),
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ))
                      ],
                    ),
                  ))),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black.withOpacity(0.5)),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(microseconds: 1000),
                  curve: Curves.easeIn);
            } else {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: ((context) => MyHomePage(title: "String"))));

              Navigator.of(context)
                  .pushNamedAndRemoveUntil('signIn', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      color: Colors.grey.withOpacity(0.5))
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
