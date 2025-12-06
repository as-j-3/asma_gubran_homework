import 'package:calories_app/styles/app_colores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_sttles.dart';

class CoustmForIconmeal extends StatelessWidget {
  final String? text;
  final String? image;
  final bool isSelect;
  final VoidCallback? onTap;

  const CoustmForIconmeal({
    super.key,
    this.text,
    this.image,
    required this.isSelect,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        isSelect ? Appcolores.sacndcolor : Colors.white;
    final Color borderColor =
        isSelect ? Appcolores.primrecolor : const Color(0xFFE0E0E0);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 68.w,
        height: 92.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: borderColor),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(image!, width: 30.w, fit: BoxFit.contain),
              SizedBox(height: 7.h),
              Text(
                text ?? '',
                style: Appstyles.secondaryStyle.copyWith(fontSize: 10.sp),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
