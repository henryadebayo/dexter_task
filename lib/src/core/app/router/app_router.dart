import 'package:dexter_task/src/ui/auth/sign_in/sign_in.dart';
import 'package:dexter_task/src/ui/auth/sign_up/sign_up.dart';
import 'package:flutter/material.dart';

import '../../../ui/add_task/presentation/add_task_page.dart';
import '../../../ui/auth/splash/splash_view.dart';
import '../../../ui/done_tasks/presentation/screens/done_task_page.dart';
import '../../../ui/home/presentation/home_screen/home_view.dart';
import '../../../ui/profile/profile_page.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signInPage:
        return MaterialPageRoute(builder: (context) {
          return const SignInPage();
        });
      case Routes.splashPage:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.signUpPage:
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );
      case Routes.signInPage:
        return MaterialPageRoute(
          builder: (context) => const SignInPage(),
        );
      case Routes.taskPage:
        return MaterialPageRoute(
          builder: (context) => const TaskPage(),
        );
      case Routes.doneTaskPage:
        return MaterialPageRoute(
          builder: (context) => DoneTaskPage(),
        );
      case Routes.addTaskPage:
        return MaterialPageRoute(
          builder: (context) => AddTaskPage(),
        );
      case Routes.profilePage:
        return MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SafeArea(
            child: Scaffold(
              body: Center(
                child: Text('Nothing to see here'),
              ),
            ),
          ),
        );
    }
  }
}

class Routes {
  static const String splashPage = '/splashPage';
  static const String signUpPage = '/signUpPage';
  static const String signInPage = '/signInPage';
  static const String taskPage = '/taskPage';
  static const String doneTaskPage = '/doneTaskPage';
  static const String addTaskPage = '/addTaskPage';
  static const String profilePage = '/profilePage';

  static const List<String> routes = [
    splashPage,
    signUpPage,
    signInPage,
    taskPage,
    addTaskPage,
    doneTaskPage,
    profilePage,
  ];
}
