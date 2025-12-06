import 'package:calories_app/styles/app_colores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class PrimaryButtem extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? width;
  final double? hight;
  final double? border;
  final Color? textcolor;
  final double? fontsise;
  final void Function()? onPressed;

  const PrimaryButtem({
    super.key,
    this.color,
    this.text,
    this.width,
    this.border,
    this.hight,
    this.textcolor,
    this.onPressed,
    this.fontsise,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      child: Text(
        text ?? '',
        style: TextStyle(
          color: textcolor ?? Colors.white,
          fontSize: fontsise,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 331.w, hight ?? 56.h),
        backgroundColor: color ?? Appcolores.primrecolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border ?? 8.r),
        ),
      ),
    );
  }
}
