import 'package:edtech/pages/course/lesson/bloc/lesson_events.dart';
import 'package:edtech/pages/course/lesson/bloc/lesson_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonBlocs extends Bloc<LessonEvents, LessonStates> {
  LessonBlocs() : super(const LessonStates()) {
    on<TriggerLessonVideo>(_triggerLessonVideo);
    on<TriggerUrlItem>(_triggerUrlItem);
    on<TriggerPlay>(_triggerPlay);
  }

  void _triggerLessonVideo(
      TriggerLessonVideo event, Emitter<LessonStates> emit) {
    emit(state.copyWith(lessonVideoItem: event.lessonVideoItem));
  }

  void _triggerUrlItem(TriggerUrlItem event, Emitter<LessonStates> emit) {
    emit(state.copyWith(
        initializeVideoPlayerFutute: event.initVideoPlayerFuture));
  }

  void _triggerPlay(TriggerPlay event, Emitter<LessonStates> emit) {
    emit(state.copyWith(isPlay: event.isPlay));
  }
}
