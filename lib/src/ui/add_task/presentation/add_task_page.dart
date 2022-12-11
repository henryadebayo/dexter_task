import 'package:dexter_task/src/core/app/theme/colors.dart';
import 'package:dexter_task/src/core/utils/constants/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/presentation/widgets/textFormWidget.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Task Guide",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0.sp),
                ),
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Text(
                "Kindly insure that task is well detailed and self explanatory for other nurses ",
                style: TextStyle(color: Colors.black, fontSize: 14.0.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0.h),
              Form(
                child: Column(
                  children: [
                    SizedBox(height: 24.0.h),
                    const TextInputWidget(
                      mnLine: 6,
                      label: "Task",
                      hintT: 'Input task details here',
                      inputType: TextInputType.text,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 3 - 20),
                    Container(
                      height: 70.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0.r),
                          color: AppColors.Blue),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Submit",
                            style: AppTextStyle.whiteMedium
                                .copyWith(fontSize: 20.0.sp),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
