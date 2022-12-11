import 'package:dexter_task/src/ui/home/presentation/home_screen/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app/theme/colors.dart';
import '../../../core/presentation/widgets/core_widgets.dart';
import '../bloc/auth_bloc/signUp_bloc/signup_bloc_bloc.dart';
import '../widgets/sign_up_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User user = User();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocConsumer<SignUpBloc, SignUpBlocState>(listener: (context, state) {
        if (state is SignedUpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.Blue,
              content: Text(
                state.errorMessage!,
                style: const TextStyle(color: Colors.white),
              ),
              action: SnackBarAction(
                label: "Dismiss",
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        }
      }, builder: (context, state) {
        if (state is SignUpLoading) {
          return Center(
            child: Container(
              color: Colors.white,
              height: 50.0.h,
              width: 70.0.w,
              child: Center(
                child: CustomLoader(label: "Creating Account"),
              ),
            ),
          );
        }
        if (state is SignedUpSuccessful) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.Blue,
              content: Text(
                state.message!,
                style: const TextStyle(color: AppColors.black),
              ),
              action: SnackBarAction(
                label: "Dismiss",
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return const TaskPage();
            }));
          });
        }
        return SignUpWidget(formKey: _formKey, user: user);
      }),
    );
  }
}
