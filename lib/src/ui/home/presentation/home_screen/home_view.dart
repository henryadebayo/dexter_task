import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dexter_task/src/core/app/theme/colors.dart';
import 'package:dexter_task/src/core/presentation/widgets/core_widgets.dart';
import 'package:dexter_task/src/core/utils/constants/app_textStyle.dart';
import 'package:dexter_task/src/ui/add_task/models/taskModel.dart';
import 'package:dexter_task/src/ui/home/task_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app/router/app_router.dart';
import '../../../../core/presentation/widgets/app_spacer.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TaskServices taskServices = TaskServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.white,
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.addTaskPage);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.Blue,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.h),
        child: Column(
          children: [
            AppSpacer.xtraHeightSpace,
            AppSpacer.xtraHeightSpace,
            AppSpacer.xtraHeightSpace,
            AppSpacer.xtraHeightSpace,
            AppSpacer.xtraHeightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Nurse 👋",
                      style:
                          AppTextStyle.blackMedium.copyWith(fontSize: 26.0.r),
                    ),
                    Text(
                      "Tasks for the current shift",
                      style: AppTextStyle.blackMedium,
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 25.0.r,
                  // backgroundColor: AppColors.exploreIconAsh,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.doneTaskPage);
                    },
                    icon: const Icon(
                      Icons.horizontal_split_sharp,
                    ),
                  ),
                ),
              ],
            ),
            AppSpacer.normalHeightSpace,
            StreamBuilder<List<GeneralTaskModel>>(
                stream: taskServices.getGeneralTask(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data?.toList());
                    final generalTaskModel = snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: generalTaskModel.length,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            return Dismissible(
                              background: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0.h),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.circular(20.0.r),
                                    ),
                                    padding: EdgeInsets.only(right: 10.0.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Done",
                                          style: AppTextStyle.whiteMedium,
                                        ),
                                        const Icon(
                                          size: 30.0,
                                          Icons.done,
                                          color: Colors.white,
                                        ),
                                      ],
                                    )),
                              ),
                              key: ValueKey(generalTaskModel[index].id),
                              onDismissed: (ksy) {
                                final doneTask = GeneralTaskModel(
                                  task: generalTaskModel[index].task,
                                  title: generalTaskModel[index].title,
                                );
                                taskServices.addTask(
                                    generalTaskModel: doneTask,
                                    collectionId: "Done_tasks");
                                final doneAction = FirebaseFirestore.instance
                                    .collection("general_task")
                                    .doc(generalTaskModel[index].id);
                                doneAction.delete();
                                print(generalTaskModel[index].id!);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 8.0.h),
                                child: Container(
                                  height: 170.0.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.Blue,
                                    borderRadius: BorderRadius.circular(20.0.r),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          generalTaskModel[index].title!,
                                          style: AppTextStyle.whiteBold
                                              .copyWith(fontSize: 24.0.sp),
                                        ),
                                        SizedBox(
                                          height: 8.0.h,
                                        ),
                                        Text(
                                          generalTaskModel[index].task!,
                                          style: AppTextStyle.whiteLight
                                              .copyWith(fontSize: 18.0.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return Expanded(
                      child: Center(
                        child: CustomLoader(
                          label: 'Loading Tasks',
                        ),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
