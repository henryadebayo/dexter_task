import 'package:dexter_task/src/ui/auth/widgets/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app/theme/colors.dart';
import '../sign_up/sign_up.dart';
import 'customTextButton.dart';
import 'formField.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    this.newUser,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final User? newUser;

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
                "Welcome back Sign in",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              )),
              SizedBox(
                height: 100.0.h,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0.h,
                      ),
                      CustomTextForm(
                        keyboardType: TextInputType.number,
                        formatter: [LengthLimitingTextInputFormatter(11)],
                        label: "Input email address",
                        autoFill: AutofillHints.email,
                        onChanged: (value) {
                          newUser?.phoneNumber = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "email address is required ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      CustomTextForm(
                        label: "Password",
                        formatter: [
                          LengthLimitingTextInputFormatter(18),
                        ],
                        autoFill: AutofillHints.password,
                        onChanged: (value) {
                          newUser?.password = value;
                        },
                        validator: (value) {
                          if (value.isEmpty
                              // ||
                              // !RegExp(r'^[a-z A-Z]+$')
                              //     .hasMatch(value)
                              ) {
                            return "password is required ";
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4 - 50,
              ),
              CustomTextButton(
                onSubmit: () {
                  if (_formKey.currentState!.validate()) {
                    // context.read<SignInBloc>().add(SignIn(
                    //     phoneNumber: newUser?.phoneNumber,
                    //     password: newUser?.password!),
                    //  );
                  }
                },
                label: "Sign In",
              ),
              SizedBox(
                height: 30.0.h,
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const SignUpPage();
                  }),
                ),
                child: const Text(
                  "Sign Up instead ?",
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
