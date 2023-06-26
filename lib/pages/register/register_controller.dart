import 'package:edtech/common/widgets/flutter_toast.dart';
import 'package:edtech/pages/register/blocs/register_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController(this.context);

  Future<void> handleEmailRgister() async {
    final state = context.read<RegisterBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "Name cannot be empty");
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: "Email cannot be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password cannot be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Password Confirm cannot be empty");
      return;
    }

    try {
      final credentail = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credentail.user != null) {
        await credentail.user?.sendEmailVerification();

        await credentail.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "An Email has been sent to your registered email. To activate it, please check your email box.");

        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == "email-already=in-use") {
        toastInfo(msg: "The email is already in use'");
      } else if (e.code == "weak-password") {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "Invalid emaiil");
      }
    }
  }
}
