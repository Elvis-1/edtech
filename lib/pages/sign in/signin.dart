import 'package:edtech/pages/sign%20in/bloc/sigin_events.dart';
import 'package:edtech/pages/sign%20in/bloc/signin_bloc.dart';
import 'package:edtech/pages/sign%20in/bloc/signin_states.dart';
import 'package:edtech/pages/sign%20in/sign_in_controller.dart';
import 'package:edtech/pages/sign%20in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) => Container(
              color: Colors.white,
              child: SafeArea(
                  child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar(),
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildThirdPartyLogin(context),
                      Center(
                          child: reusableText(
                              "Or use your email accounnt to log in")),
                      Container(
                        margin: EdgeInsets.only(top: 36.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText("Email"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField(
                                "Enter Your email address", "Email", "user",
                                (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            }),
                            reusableText("Password"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField(
                                "Enter Your email address", "password", "lock",
                                (value) {
                              context
                                  .read<SignInBloc>()
                                  .add(PasswordEvent(value));
                            }),
                          ],
                        ),
                      ),
                      forgotPassword(),
                      buildLoginAndRegBtn("Log in", 'login', () {
                        SignInController(context: context)
                            .handleSignIn("email");
                      }),
                      buildLoginAndRegBtn("Register", 'register', () {}),
                    ],
                  ),
                ),
              )),
            ));
  }
}
