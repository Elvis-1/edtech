import 'package:edtech/common/values/constant.dart';
import 'package:edtech/global.dart';
import 'package:edtech/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:edtech/pages/profile/settings/bloc/settings_state.dart';
import 'package:edtech/pages/profile/settings/widgets/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Confirm logout",
                          ),
                          content: const Text(
                            "Confirm logout",
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cancel")),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Global.storageService.remove(
                                      AppConstants.STORAGE_USER_TOKEN_KEY);
                                },
                                child: const Text("Confirm"))
                          ],
                        );
                      });
                },
                child: Container(
                  height: 100.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage("assets/icons/Logout.png"))),
                ),
              ),
            ]),
          );
        }),
      ),
    );
  }
}
