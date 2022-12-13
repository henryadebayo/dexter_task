import 'package:dexter_task/src/ui/home/task_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/presentation/widgets/textFormWidget.dart';
import '../../auth/widgets/customTextButton.dart';
import '../models/taskModel.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();
  TaskServices taskServices = TaskServices();
  String? task;
  String? title;

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
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 24.0.h),
                    TextInputWidget(
                      mnLine: 1,
                      label: "Task Title",
                      hintT: 'Input task title',
                      errorMessagee: "please input task title",
                      inputType: TextInputType.text,
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    TextInputWidget(
                      mnLine: 6,
                      label: "Task",
                      hintT: 'Input task details here',
                      errorMessagee: "please input task",
                      inputType: TextInputType.text,
                      onChanged: (value) {
                        task = value;
                      },
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 3 - 20),
                    CustomTextButton(
                      onSubmit: () {
                        final generalTask = GeneralTaskModel(
                          task: task,
                          title: title,
                        );
                        if (_formKey.currentState!.validate()) {
                          print(task);
                          taskServices.addTask(
                            collectionId: "general_task",
                            generalTaskModel: generalTask,
                          );
                        }
                        print("Done");
                      },
                      label: "Create task",
                    ),
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
