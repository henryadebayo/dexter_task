import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputWidget extends StatelessWidget {
  final String hintT;
  final String label;
  final TextInputType inputType;
  final int? mxLine;
  final int? mnLine;

  const TextInputWidget(
      {required this.hintT,
      required this.label,
      required this.inputType,
      this.mnLine,
      this.mxLine,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8.0.h,
        ),
        TextFormField(
            maxLines: mxLine,
            minLines: mnLine,
            keyboardType: inputType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0.r),
                borderSide: const BorderSide(
                  color: Color(0xFF0E3E3E3),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0.r),
                //borderSide: BorderSide(color: Colors.black),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 19.w,
                vertical: 15.h,
              ),
              hintText: hintT,
              hintStyle: TextStyle(fontSize: 14.sp),
            ),
            onSaved: (String? lastNamee) {},
            // ignore: missing_return
            validator: (String? lastName) {
              if (lastName!.isEmpty) {
                String errorMessage;
                errorMessage = "please fill in your last name";
                return errorMessage;
              }
            }),
      ],
    );
  }
}