import 'package:edtech/common/values/colors.dart';
import 'package:edtech/common/widgets/base_text_widget.dart';
import 'package:edtech/pages/course/lesson/bloc/lesson_bloc.dart';
import 'package:edtech/pages/course/lesson/bloc/lesson_events.dart';
import 'package:edtech/pages/course/lesson/bloc/lesson_states.dart';
import 'package:edtech/pages/course/lesson/lesson_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class LessonDetailsPage extends StatefulWidget {
  const LessonDetailsPage({super.key});

  @override
  State<LessonDetailsPage> createState() => _LessonDetailsState();
}

class _LessonDetailsState extends State<LessonDetailsPage> {
  int videoIndex = 0;
  late LessonController _lessonController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    _lessonController = LessonController(context: context);
    context.read<LessonBlocs>().add(TriggerUrlItem(null));
    _lessonController.init();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _lessonController.videoPlayerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBlocs, LessonStates>(builder: (context, state) {
      return SafeArea(
          child: Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar("Lesson Detail"),
          body: CustomScrollView(slivers: [
            SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                sliver: SliverToBoxAdapter(
                  child: Container(
                      child: Column(children: [
                    Container(
                        width: 325.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/video.png"),
                              fit: BoxFit.fitWidth),
                          borderRadius: BorderRadius.circular(20.h),
                        ),
                        child: FutureBuilder(
                            future: state.initializeVideoPlayerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return _lessonController
                                            .videoPlayerController ==
                                        null
                                    ? Container()
                                    : AspectRatio(
                                        aspectRatio: _lessonController
                                            .videoPlayerController!
                                            .value
                                            .aspectRatio,
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            VideoPlayer(_lessonController
                                                .videoPlayerController!),
                                            VideoProgressIndicator(
                                              _lessonController
                                                  .videoPlayerController!,
                                              allowScrubbing: true,
                                              colors: VideoProgressColors(
                                                  playedColor:
                                                      AppColors.primaryElement),
                                            )
                                          ],
                                        ),
                                      );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            })),
                  ])),
                ))
          ]),
        ),
      ));
    });
  }
}
