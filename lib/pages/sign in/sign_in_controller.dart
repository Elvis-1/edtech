import 'package:edtech/common/values/constant.dart';
import 'package:edtech/common/widgets/flutter_toast.dart';
import 'package:edtech/pages/sign%20in/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        // BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          //
          toastInfo(msg: "You need to fill in an email address");
          return;
        }
        if (password.isEmpty) {
          //
          toastInfo(msg: "You need to fill in a password");
          return;
        }

        try {
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
            print("user exists");
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
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
    } catch (e) {}
  }
}
