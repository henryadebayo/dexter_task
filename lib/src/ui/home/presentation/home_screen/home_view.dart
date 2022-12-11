import 'package:dexter_task/src/core/app/theme/colors.dart';
import 'package:dexter_task/src/core/utils/constants/app_textStyle.dart';
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
  List<dynamic> items = [
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1
  ];
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.horizontal_split_sharp,
                    ),
                  ),
                ),
              ],
            ),
            AppSpacer.normalHeightSpace,
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
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
                                borderRadius: BorderRadius.circular(20.0.r)),
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
                      key: ValueKey(items[index]),
                      onDismissed: (ksy) {},
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8.0.h),
                        child: Container(
                          height: 170.0.h,
                          decoration: BoxDecoration(
                            color: AppColors.Blue,
                            borderRadius: BorderRadius.circular(20.0.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Hello the patient in ward 32 needs waverer and need for their diapers to be changed ",
                              style: AppTextStyle.whiteLight
                                  .copyWith(fontSize: 18.0.sp),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
