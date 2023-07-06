import 'package:edtech/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:edtech/pages/profile/settings/bloc/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: BlocBuilder<SettingsBloc, SettingStates>(
              builder: (context, state) {
            return Container(
              child: Column(children: [Text("Hello World")]),
            );
          }),
        ),
      ),
    );
  }
}
