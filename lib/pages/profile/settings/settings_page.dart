import 'package:edtech/common/routes/names.dart';
import 'package:edtech/common/values/constant.dart';
import 'package:edtech/global.dart';
import 'package:edtech/pages/application/bloc/app_events.dart';
import 'package:edtech/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:edtech/pages/profile/settings/bloc/settings_state.dart';
import 'package:edtech/pages/profile/settings/widgets/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/bloc/app_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child:
            BlocBuilder<SettingsBloc, SettingStates>(builder: (context, state) {
          return Container(
            child: Column(children: [
              settingsButton(context, removeUserData),
            ]),
          );
        }),
      ),
    );
  }
}
