import 'package:edtech/pages/profile/settings/bloc/settings_event.dart';
import 'package:edtech/pages/profile/settings/bloc/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingStates> {
  SettingsBloc() : super(const SettingStates()) {
    on<TriggerSettings>(_triggerSettings);
  }
  void _triggerSettings(SettingsEvent event, Emitter<SettingStates> emit) {
    emit(const SettingStates());
  }
}
