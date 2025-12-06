import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/app_colores.dart';
import '../../styles/app_sttles.dart';

class CotmusMael extends StatelessWidget {
  final List<int>? Calorie;
  final List<dynamic>? meal;
  final String? mealtype;

  const CotmusMael({super.key, this.Calorie, this.meal, this.mealtype});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 304.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Color(0xFFF5F5F5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mealtype!,
                style: Appstyles.secondaryStyle.copyWith(fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      for (int i = 0; i < meal!.length; i++) ...[
                        Text(' - ' + meal![i], style: TextStyle(fontSize: 10)),
                      ],
                    ],
                  ),

                  Column(
                    children: [
                      for (int i = 0; i < meal!.length; i++) ...[
                        Text(
                          '${Calorie![i]}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Appcolores.primrecolor,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
