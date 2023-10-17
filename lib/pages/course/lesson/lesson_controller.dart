import 'package:edtech/common/apis/lesson_api.dart';
import 'package:edtech/common/entities/entities.dart';
import 'package:edtech/pages/course/lesson/bloc/lesson_bloc.dart';
import 'package:edtech/pages/course/lesson/bloc/lesson_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class LessonController {
  final BuildContext context;
  VideoPlayerController? videoPlayerController;

  LessonController({required this.context});

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    context.read<LessonBlocs>().add(TriggerPlay(false));
    asyncLoadLessonData(args['id']);
  }

  void asyncLoadLessonData(int? id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = id;
    var result = await LessonApi.lessonDetail(params: lessonRequestEntity);

    if (result.code == 200) {
      context.read<LessonBlocs>().add(TriggerLessonVideo(result.data!));
      if (result.data!.isNotEmpty) {
        var url = result.data!.elementAt(0).url;
        // print()
        videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(url!));
        var initPlayer = videoPlayerController!.initialize();
        context.read<LessonBlocs>().add(TriggerUrlItem(initPlayer));
      }
    }
  }
}
