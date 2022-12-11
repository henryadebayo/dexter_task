import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app/theme/colors.dart';

class CustomTextForm extends StatelessWidget {
  String label;
  List<TextInputFormatter>? formatter;
  final int? maxLenghth;
  var keyboardType;
  var autoFill;
  FormFieldValidator validator;
  IconButton? suffixIcon;
  double? height;
  bool? hideText;
  final ValueChanged<String> onChanged;
  CustomTextForm({
    Key? key,
    this.formatter,
    required this.onChanged,
    required this.label,
    this.maxLenghth,
    this.autoFill,
    this.height,
    this.suffixIcon,
    this.hideText,
    this.keyboardType,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: formatter,
      // inputFormatters: [LengthLimitingTextInputFormatter(13)],
      style: const TextStyle(color: Colors.black),
      keyboardType: keyboardType,
      autofillHints: [autoFill],
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        counterStyle: const TextStyle(color: Colors.black),
        suffix: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0.r),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0.r),
          borderSide: const BorderSide(color: AppColors.Blue),
        ),
        labelStyle: const TextStyle(color: Colors.black),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 19.w,
          vertical: 14.h,
        ),
        // hintText: label,
        // label: Text(label),
        labelText: label,
        // fillColor: Colors.white,
        // filled: true,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0.r),
          borderSide: const BorderSide(color: AppColors.Blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
