import 'package:dexter_task/src/ui/auth/sign_in/sign_in.dart';
import 'package:dexter_task/src/ui/home/presentation/home_screen/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app/theme/colors.dart';
import '../bloc/auth_bloc/signUp_bloc/signup_bloc_bloc.dart';
import 'customTextButton.dart';
import 'formField.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.user,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: 8.0.w, right: 8.0.w, top: 20.0.h, bottom: 40.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0.h,
              ),
              const Center(
                  child: Text(
                "Create an account",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              )),
              SizedBox(
                height: 120.0.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextForm(
                      label: "Name",
                      autoFill: AutofillHints.name,
                      validator: (value) {
                        if (value.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return "Name is required";
                        }
                        return null;
                      },
                      onChanged: (String value) {},
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    CustomTextForm(
                      label: "Email",
                      autoFill: AutofillHints.email,
                      onChanged: (value) {},
                      validator: (value) {
                        if (value.isEmpty
                            // ||
                            // !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                            ) {
                          return "Please Enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    CustomTextForm(
                        label: "Password",
                        autoFill: AutofillHints.password,
                        onChanged: (value) {
                          user.password = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "enter a strong password";
                          }
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 100.0.h,
              ),
              CustomTextButton(
                onSubmit: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<SignUpBloc>().add(
                          SignUp(
                              phoneNumber: user.phoneNumber!,
                              password: user.password!),
                        );
                  }
                },
                label: "Sign Up",
              ),
              SizedBox(
                height: 30.0.h,
              ),
              SizedBox(
                height: 10.0.h,
              ),
              TextButton(
                onLongPress: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const TaskPage();
                  }),
                ),
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const SignInPage();
                  }),
                ),
                child: const Text(
                  "Sign In instead ?",
                  style: TextStyle(color: AppColors.Blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  String? password;
  String? phoneNumber;
}
