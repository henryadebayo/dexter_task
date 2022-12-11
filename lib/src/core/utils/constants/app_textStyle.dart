import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle whiteLight = GoogleFonts.inter(color: Colors.white);

  static TextStyle whiteMedium = GoogleFonts.inter(
      // fontFamily: VeloxFonts.markPro,
      fontWeight: FontWeight.w500,
      color: Colors.white);

  static TextStyle whiteBold = GoogleFonts.inter(
      // fontFamily: VeloxFonts.markPro,
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static TextStyle blackLight = GoogleFonts.inter(color: Colors.black);

  static TextStyle blackMedium =
      GoogleFonts.inter(fontWeight: FontWeight.w500, color: Colors.black);

  static TextStyle blackBold =
      GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle blueLight = GoogleFonts.inter(color: Colors.blue);

  static TextStyle blueMedium = GoogleFonts.inter(
      // fontFamily: VeloxFonts.markPro,
      fontWeight: FontWeight.w500,
      color: Colors.blue);

  static TextStyle blueBold =
      GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.blue);
}
