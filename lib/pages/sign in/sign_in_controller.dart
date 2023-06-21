import 'package:edtech/pages/sign%20in/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          print("Email is empty");
        }
        if (password.isEmpty) {
          //
          print("Password is empty");
        }

        try {
          final credentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credentials.user == null) {
            //
            print("User does not exist");
          }
          if (credentials.user!.emailVerified) {}

          var user = credentials.user;

          if (user != null) {
            // we got a verified user from firebase
            print("user exists");
          } else {
            print("no user");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            print("No user found for that email");
          } else if (e.code == "wrong-password") {
            print("wrong password provided for that user");
          } else if (e.code == "invalid-email") {
            print("Email format wrong");
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
