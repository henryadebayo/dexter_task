import 'package:dexter_task/src/ui/home/presentation/home_screen/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app/theme/colors.dart';
import '../../../core/presentation/widgets/custom_loader.dart';
import '../bloc/auth_bloc/signIn_bloc/sign_in_bloc_bloc.dart';
import '../widgets/sign_in_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //User newUser = User();
  late final String email;
  late final String password;
  final _formKey = GlobalKey<FormState>();

  get newUser => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(listener: (context, state) {
        if (state is SignInError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.Blue,
              content: Text(
                state.errorMsg!,
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
        if (state is SignInLoading) {
          return Center(
            child: Container(
                color: Colors.white,
                height: 50.0.h,
                width: 70.0.w,
                child: Center(child: CustomLoader(label: "Creating Account"))),
          );
        }
        if (state is SignInSuccessful) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.Blue,
              content: Text(
                state.message!,
                style: const TextStyle(color: Colors.white),
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
        return SignInWidget(formKey: _formKey, newUser: newUser);
      }),
    );
  }
}
