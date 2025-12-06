import 'package:flutter/material.dart'; // تم التبديل إلى Material
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colores.dart';
import '../styles/app_images.dart';
import '../styles/app_sttles.dart';

class BodeUser extends StatelessWidget {
  final String title;
  final String value;
  final String unit;

  const BodeUser({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Appimages.Calories,
                  color: Appcolores.primrecolor,
                  width: 20.w,
                ),
                SizedBox(width: 5.w),
                Text(title, style: Appstyles.secondaryStyle),
              ],
            ),
            SizedBox(height: 17.h),
            Text(
              value,
              style: Appstyles.secondaryStyle.copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Appcolores.primrecolor,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              unit,
              style: Appstyles.secondaryStyle.copyWith(
                fontSize: 14.sp,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
