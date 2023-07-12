import 'package:edtech/common/entities/entities.dart';
import 'package:edtech/global.dart';
import 'package:flutter/material.dart';

class HomeController {
  final BuildContext context;
  HomeController({required this.context});

  UserItem? userProfile = Global.storageService.getUserProfile();

  void inite() {
    print("... home init method...");
  }
}
