import 'package:calories_app/styles/app_colores.dart';
import 'package:calories_app/styles/app_images.dart';
import 'package:calories_app/styles/app_sttles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data_meal/data_meal.dart';
import '../screen/main_screen/home_screen.dart';
import 'MealItemCard.dart';
import 'coustm_for_iconmeal.dart';

class AddMael extends StatefulWidget {
  final void Function(Map<String, dynamic>)? onAddMeal;

  const AddMael({super.key, this.onAddMeal});

  @override
  State<AddMael> createState() => _AddMaelState();
}

class _AddMaelState extends State<AddMael> {
  List<bool> isSelect = [true, false, false, false];
  final allMeals = [
    Data_meal.breakfastMeals,
    Data_meal.lunchMeals,
    Data_meal.dinnerMeals,
    Data_meal.snacksMeals,
  ];
  List<Map<String, dynamic>> addedMeals = [];
  final mealTypes = ["فطور", "غداء", "عشاء", "وجبة خفيفة"];

  void selectIndex(int idx) {
    setState(() {
      for (int i = 0; i < isSelect.length; i++) {
        isSelect[i] = (i == idx);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedType = mealTypes[isSelect.indexOf(true)];
    final selectedMeals = allMeals[isSelect.indexOf(true)];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView(
        children: [
          SizedBox(height: 17.h),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: Color(0xFFE0E0E0)),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('إضافة وجبة جديدة', style: Appstyles.secondaryStyle),
                      SizedBox(width: 5.w),

                      Icon(
                        Icons.add_circle_outline,
                        color: Appcolores.primrecolor,
                        weight: 20.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 44.h),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CoustmForIconmeal(
                          text: 'إفطار',
                          image: Appimages.breakfast,
                          isSelect: isSelect[0],
                          onTap: () => selectIndex(0),
                        ),
                        CoustmForIconmeal(
                          text: 'غداء',
                          image: Appimages.lunch,
                          isSelect: isSelect[1],
                          onTap: () => selectIndex(1),
                        ),
                        CoustmForIconmeal(
                          text: 'عشاء',
                          image: Appimages.dinner,
                          isSelect: isSelect[2],
                          onTap: () => selectIndex(2),
                        ),
                        CoustmForIconmeal(
                          text: 'خفيفه',
                          image: Appimages.snacks,
                          isSelect: isSelect[3],
                          onTap: () => selectIndex(3),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 44.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('وجبات شائعة', style: Appstyles.secondaryStyle),
                      SizedBox(width: 10.w),

                      Image.asset(Appimages.food, width: 20.w),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    children: [
                      for (var meal in selectedMeals) ...[
                        Mealitemcard(
                          name: meal['name'],
                          calories: meal['calories'],
                          carbs: meal['carbs'],
                          protein: meal['protein'],
                          fats: meal['fats'],
                          onAdd: () {
                            final newMeal = {
                              'name': meal['name'],
                              'calories': meal['calories'],
                              'protein': meal['protein'],
                              'carbs': meal['carbs'],
                              'fats': meal['fats'],
                              'type': selectedType,
                              'date': DateTime.now(),
                            };

                            if (widget.onAddMeal != null)
                              widget.onAddMeal!(newMeal);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${meal['name']} تمت الإضافة'),
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 12),
                      ],
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
