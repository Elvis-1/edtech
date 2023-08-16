import 'dart:convert';
import 'dart:math';

import 'package:edtech/common/entities/entities.dart';
import 'package:edtech/common/service/conection_service.dart';
import 'package:edtech/common/values/constant.dart';
import 'package:edtech/common/widgets/dialog.dart';
import 'package:edtech/common/widgets/flutter_toast.dart';
import 'package:edtech/pages/home/home_controller.dart';
import 'package:edtech/pages/sign%20in/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../common/apis/user_api.dart';
import '../../global.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) async {
    var result = await InternetConnection().checkInternetConnection();
    if (!result) {
      if (context.mounted) {
        showDialogueBox(
            context,
            "Please check your internet connection and try again",
            'Internet Connection');
        return;
      }
    }
    try {
      if (type == "email") {
        // BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String passwordAddress = state.password;

        if (email.isEmpty) {
          //
          toastInfo(msg: "You need to fill in an email address");
          return;
        }
        if (passwordAddress.isEmpty) {
          //
          toastInfo(msg: "You need to fill in a password");
          return;
        }

        try {
          String emailAddress = email.trim();
          String password = passwordAddress.trim();
          final credentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credentials.user == null) {
            //
            toastInfo(msg: "User does not exist");
            return;
          }
          if (!credentials.user!.emailVerified) {
            toastInfo(msg: "User not verified");
            return;
          }

          var user = credentials.user;

          if (user != null) {
            // we got a verified user from firebase
            String? displayName = user.displayName;

            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;

            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;

            // type 1 means email login
            loginRequestEntity.type = 1;
            await asyncPostAllData(loginRequestEntity);

            if (context.mounted) {
              await HomeController(context: context).init();
            }
          } else {
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            toastInfo(msg: "No User found for that email");
            return;
          } else if (e.code == "wrong-password") {
            toastInfo(msg: "wrong password provided for that user");
            return;
          } else if (e.code == "invalid-email") {
            toastInfo(msg: "Your Email format wrong");
            return;
          }
        } catch (e) {}
      }
    } catch (e) {
      print("Got here");
      print(e.toString());
    }
  }

  asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );

    try {
      var result = await UserAPI.login(params: loginRequestEntity);

      if (result.code == 200) {
        try {
          Global.storageService.setString(
              AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data));
          Global.storageService.setString(
              AppConstants.STORAGE_USER_TOKEN_KEY, result.data.access_token);
          EasyLoading.dismiss();
          if (context.mounted) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
            return;
          }
        } catch (e) {
          print("saving local storage error ${e.toString()}");
        }
      } else {
        print('code is not 200');
        EasyLoading.dismiss();
        toastInfo(msg: "Unknown Error");
      }
    } catch (e) {
      print(e);
    }
  }
}
