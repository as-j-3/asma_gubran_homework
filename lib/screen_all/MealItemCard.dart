import 'package:calories_app/rote/rote_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data_meal/data_meal.dart';
import '../styles/app_colores.dart';
import '../styles/app_sttles.dart';

class Mealitemcard extends StatelessWidget {
  final String name;
  final int calories;
  final int protein;
  final int carbs;
  final int fats;
  final VoidCallback? onAdd;

  const Mealitemcard({
    super.key,
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66.h,
      decoration: BoxDecoration(
        color: Color(0xfff9fafb),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Color(0xFFE0E0E0)),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name+'-',

                    style: Appstyles.secondaryStyle.copyWith(fontSize: 12.sp),
                  ),

                  Text(
                    '${calories} سعرة',
                    style: Appstyles.secondaryStyle.copyWith(
                      fontSize: 10,
                      color: Appcolores.primrecolor,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'بروتين-',
                    style: Appstyles.secondaryStyle.copyWith(
                      fontSize: 10.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${protein} ',
                    style: Appstyles.secondaryStyle.copyWith(
                      fontSize: 10,
                      color: Appcolores.primrecolor,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'كربوهيدرات',
                    style: Appstyles.secondaryStyle.copyWith(
                      fontSize: 10.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${carbs} ',
                    style: Appstyles.secondaryStyle.copyWith(
                      fontSize: 10.sp,
                      color: Appcolores.primrecolor,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'دهون',
                    style: Appstyles.secondaryStyle.copyWith(
                      fontSize: 10.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${fats} ',
                    style: Appstyles.secondaryStyle.copyWith(
                      fontSize: 10.sp,
                      color: Appcolores.primrecolor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 50.w,
                height: 40.h,
                child: ElevatedButton(
                  onPressed: onAdd,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolores.primrecolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text('إضافة', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
