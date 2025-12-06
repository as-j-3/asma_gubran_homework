import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/app_colores.dart';
import '../styles/app_sttles.dart';
import '../styles/app_images.dart';

class MealSummaryCard extends StatelessWidget {
  final String nameMeal;
  final String caloriesDaye;
  final String conterType;
  final String protencoent;
  final String carpocoent;
  final String fatcoent;

  final VoidCallback? onDelete;

  const MealSummaryCard({
    super.key,
    required this.nameMeal,
    required this.caloriesDaye,
    required this.conterType,
    required this.protencoent,
    required this.carpocoent,
    required this.fatcoent,

    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),

          Container(
            height: 140.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.wb_sunny_outlined, size: 15),
                          Text(' ' + nameMeal, style: Appstyles.secondaryStyle),
                        ],
                      ),
                      GestureDetector(
                        onTap: onDelete,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 5.h),


                  Container(
                    width: 60.w,
                    height: 25.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Appcolores.proteinColorText.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      conterType,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Appimages.Calories,
                            width: 20.w,
                            color: Appcolores.proteinColorText,
                          ),
                          Text(
                            '   ${caloriesDaye} ',
                            style: TextStyle(
                              color: Appcolores.proteinColorText,
                            ),
                          ),
                          Text(
                            'سعرة- ',
                            style: TextStyle(
                              color: Appcolores.proteinColorText,
                            ),
                          ),
                        ],
                      ),

                      Expanded(
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: [
                            Text(
                              'بروتين: ${protencoent} ',
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              'كربوهيدرات: ${carpocoent} ',
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              'دهون: ${fatcoent}  ',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
