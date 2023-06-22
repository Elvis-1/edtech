import 'package:edtech/pages/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar("Sign Up"),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                  child: reusableText(
                      "Enter your details below for a free sign up")),
              Container(
                margin: EdgeInsets.only(top: 36.h),
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText("User Name"),
                    buildTextField("Enter your user name", "name", "user",
                        (value) {
                      //context.read<SignInBloc>().add(EmailEvent(value));
                    }),
                    reusableText("Email"),
                    buildTextField("Enter Your email address", "Email", "user",
                        (value) {
                      //context.read<SignInBloc>().add(EmailEvent(value));
                    }),
                    reusableText("Password"),
                    buildTextField(
                        "Enter Your email address", "password", "lock",
                        (value) {
                      // context
                      //     .read<SignInBloc>()
                      //     .add(PasswordEvent(value));
                    }),
                    reusableText("Re-enter your password"),
                    buildTextField("Confirm your password", "password", "lock",
                        (value) {
                      // context
                      //     .read<SignInBloc>()
                      //     .add(PasswordEvent(value));
                    }),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25.w),
                child:
                    reusableText("Enter your details below for a free sign up"),
              ),
              buildLoginAndRegBtn("Sign Up", 'login', () {
                Navigator.of(context).pushNamed("register");
              }),
            ],
          ),
        ),
      )),
    );
  }
}
