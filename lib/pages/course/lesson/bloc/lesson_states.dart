import 'package:edtech/common/entities/entities.dart';

class LessonStates {
  final List<LessonVideoItem> lessonVideoItem;
  final Future<void>? initializeVideoPlayerFuture;
  final bool isPlay;

  const LessonStates(
      {this.lessonVideoItem = const <LessonVideoItem>[],
      this.isPlay = false,
      this.initializeVideoPlayerFuture});

  LessonStates copyWith(
      {List<LessonVideoItem>? lessonVideoItem,
      bool? isPlay,
      Future<void>? initializeVideoPlayerFutute}) {
    return LessonStates(
        lessonVideoItem: lessonVideoItem ?? this.lessonVideoItem,
        isPlay: isPlay ?? this.isPlay,
        initializeVideoPlayerFuture:
            initializeVideoPlayerFuture ?? this.initializeVideoPlayerFuture);
  }
}
