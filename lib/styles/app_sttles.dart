import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colores.dart';

class Appstyles
{
  static TextStyle primtexsty = GoogleFonts.cairo(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Appcolores.primrecolor
  ) ;

  static final TextStyle secondaryStyle = GoogleFonts.cairo(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: Appcolores.colorscondre
  );
  static final TextStyle gruy12w500style = GoogleFonts.cairo(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color:Color(0xff9CA4AB),
  );
  static final TextStyle blake15 = GoogleFonts.cairo(
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black

  );
}