import 'package:dexter_task/src/core/app/router/app_router.dart';
import 'package:dexter_task/src/ui/auth/bloc/auth_bloc/signIn_bloc/sign_in_bloc_bloc.dart';
import 'package:dexter_task/src/ui/auth/bloc/auth_bloc/signUp_bloc/signup_bloc_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          // ScreenUtil.init(context);
          return MultiBlocProvider(
            providers: [
              BlocProvider<SignUpBloc>(create: (ctx) => SignUpBloc()),
              BlocProvider<SignInBloc>(create: (ctx) => SignInBloc()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute: Routes.splashPage,
              onGenerateRoute: AppRouter.onGenerateRoute,
            ),
          );
        });
  }
}
