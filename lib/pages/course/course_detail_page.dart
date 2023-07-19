import 'package:edtech/common/values/colors.dart';
import 'package:edtech/common/widgets/base_text_widget.dart';
import 'package:edtech/pages/course/widgets/course_detials_widget.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  late var id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as Map;
    print(id.values.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // first big image
                      thumbnail(),
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
                      descriptionText(),
                      SizedBox(
                        height: 20.h,
                      ),
                      goBuyButton("Go Buy"),
                    ]),
              )
            ],
          )),
        ));
  }
}
