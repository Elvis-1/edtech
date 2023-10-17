import 'package:edtech/pages/course/lesson/bloc/lesson_bloc.dart';
import 'package:edtech/pages/course/lesson/bloc/lesson_events.dart';
import 'package:edtech/pages/course/lesson/lesson_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    super.didChangeDependencies();
    _lessonController = LessonController(context: context);
    context.read<LessonBlocs>().add(TriggerUrlItem(null));
    _lessonController.init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _lessonController.videoPlayerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Video Lesson")),
    );
  }
}
