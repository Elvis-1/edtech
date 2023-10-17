import 'package:edtech/common/entities/lesson.dart';

abstract class LessonEvents {
  const LessonEvents();
}

class TriggerLessonVideo extends LessonEvents {
  const TriggerLessonVideo(this.lessonVideoItem);
  final List<LessonVideoItem> lessonVideoItem;
}

class TriggerUrlItem extends LessonEvents {
  final Future<void>? initVideoPlayerFuture;
  const TriggerUrlItem(this.initVideoPlayerFuture);
}

class TriggerPlay extends LessonEvents {
  final bool isPlay;
  const TriggerPlay(this.isPlay);
}
