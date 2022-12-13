import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app/theme/colors.dart';
import '../../../../core/presentation/widgets/core_widgets.dart';
import '../../../../core/utils/constants/app_textStyle.dart';
import '../../../add_task/models/taskModel.dart';
import '../../../home/task_services.dart';

class DoneTaskPage extends StatelessWidget {
  DoneTaskPage({Key? key}) : super(key: key);
  final TaskServices taskServices = TaskServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "Completed Tasks ✅",
                      style:
                          AppTextStyle.blackMedium.copyWith(fontSize: 26.0.r),
                    ),
                    Text(
                      "Here is a List completed tasks",
                      style: AppTextStyle.blackMedium,
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 25.0.r,
                  // backgroundColor: AppColors.deepBlueGrey,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Text("❌"),
                      // icon: const Icon(
                      //   Icons.cancel_outlined,
                      // ),
                    ),
                  ),
                ),
              ],
            ),
            AppSpacer.normalHeightSpace,
            StreamBuilder<List<GeneralTaskModel>>(
                stream: taskServices.getDoneTask(),
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
                            return Padding(
                              padding: EdgeInsets.only(bottom: 8.0.h),
                              child: Container(
                                height: 170.0.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.deepBlueGrey,
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
