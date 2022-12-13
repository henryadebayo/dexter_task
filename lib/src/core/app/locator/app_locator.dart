import 'package:get_it/get_it.dart';

import '../../../ui/home/task_services.dart';

GetIt _getIt = GetIt.I;

final locator = _getIt;

setupLocator() {
  // _getIt.registerLazySingleton<TaskServices>(
  //   () => TaskServices(),
  // );
  locator.registerLazySingleton<TaskServices>(() => TaskServices());
}
