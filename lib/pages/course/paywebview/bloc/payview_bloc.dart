import 'package:edtech/pages/course/paywebview/bloc/payview_events.dart';
import 'package:edtech/pages/course/paywebview/bloc/payview_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayWebViewBlocs extends Bloc<PayWebViewEvent, PayWebViewStates> {
  PayWebViewBlocs() : super(const PayWebViewStates()) {
    on<TriggerWebView>(_triggerWebView);
  }

  void _triggerWebView(TriggerWebView event, Emitter<PayWebViewStates> emit) {
    emit(state.copyWith(url: event.url));
  }
}
