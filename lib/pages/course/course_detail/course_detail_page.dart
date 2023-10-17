import 'package:edtech/common/values/colors.dart';
import 'package:edtech/common/widgets/base_text_widget.dart';
import 'package:edtech/pages/course/course_detail/bloc/course_detail_bloc.dart';
import 'package:edtech/pages/course/course_detail/bloc/course_detail_state.dart';
import 'package:edtech/pages/course/course_detail/course_detail_controller.dart';
import 'package:edtech/pages/course/widgets/course_detials_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  late CourseDetailController _courseDetailController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _courseDetailController = CourseDetailController(context: context);
    _courseDetailController.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailsBloc, CourseDetailsState>(
        builder: (context, state) {
      return state.courseItem == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.white,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar("Course Detail"),
                body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 25.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // first big image
                                thumbnail(state),
                                SizedBox(
                                  height: 15.h,
                                ),
                                // three buttons or menu
                                menuView(),
                                SizedBox(
                                  height: 15.h,
                                ),
                                // course description title
                                reusableText("Course Description"),
                                SizedBox(
                                  height: 15.h,
                                ),
                                // course description
                                descriptionText(state.courseItem!.description!),
                                SizedBox(
                                  height: 20.h,
                                ),
                                // couse buy button
                                GestureDetector(
                                    onTap: () {
                                      _courseDetailController
                                          .goBuy(state.courseItem!.id);
                                    },
                                    child: goBuyButton("Go Buy")),
                                SizedBox(
                                  height: 20.h,
                                ),
                                // course summary title
                                courseSummaryTitle(),

                                // course summary in list
                                courseSummaryView(context, state),
                                SizedBox(
                                  height: 20.h,
                                ),
                                reusableText("Lesson List"),
                                SizedBox(
                                  height: 20.h,
                                ),
                                courseLessonList(state),
                              ]),
                        )
                      ],
                    )),
              ));
    });
  }
}
