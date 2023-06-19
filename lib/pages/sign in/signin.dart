import 'package:edtech/pages/sign%20in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: reusableText("Or use your email accounnt to log in")),
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
                    buildTextField("Enter Your email address", "Email", "user"),
                    reusableText("Password"),
                    SizedBox(
                      height: 5.h,
                    ),
                    buildTextField(
                        "Enter Your email address", "password", "lock"),
                  ],
                ),
              ),
              forgotPassword(),
              buildLoginAndRegBtn("Log in", 'login'),
              buildLoginAndRegBtn("Register", 'register'),
            ],
          ),
        ),
      )),
    );
  }
}
