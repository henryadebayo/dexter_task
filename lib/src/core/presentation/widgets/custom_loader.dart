import 'package:flutter/material.dart';

import '../../app/theme/colors.dart';

class CustomLoader extends StatelessWidget {
  final String label;

  CustomLoader({required this.label});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppColors.Blue,
      backgroundColor: Colors.white,
      semanticsLabel: label,
    );
  }
}
