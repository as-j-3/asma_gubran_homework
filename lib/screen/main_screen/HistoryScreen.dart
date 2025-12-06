import 'package:calories_app/screen_all/MealSummaryCard.dart';
import 'package:calories_app/styles/app_colores.dart';
import 'package:calories_app/styles/app_sttles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../styles/app_images.dart'; // 💡 ستحتاج لإضافة 'intl: ^0.18.1' إلى pubspec.yaml

class HistoryScreen extends StatefulWidget {
  final List<Map<String, dynamic>>? allMeals;

  const HistoryScreen({super.key, this.allMeals});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Map<String, List<Map<String, dynamic>>> groupedMealsByDay = {};

  @override
  void initState() {
    super.initState();
    _groupMeals();
  }

  @override
  void didUpdateWidget(covariant HistoryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.allMeals != widget.allMeals) {
      _groupMeals();
    }
  }

  void _groupMeals() {
    groupedMealsByDay = {};
    final meals = widget.allMeals ?? [];

    for (var meal in meals) {

      final DateTime mealDate =
          (meal['date'] is DateTime)
              ? meal['date'] as DateTime
              : DateTime.now();

      // تنسيق التاريخ كمفتاح (مثل: 2025-11-29)
      final String dateKey = DateFormat('yyyy-MM-dd').format(mealDate);


      if (!groupedMealsByDay.containsKey(dateKey)) {
        groupedMealsByDay[dateKey] = [];
      }


      groupedMealsByDay[dateKey]!.add(meal);
    }

    if (mounted) setState(() {});
  }

  int _calculateDailyCalories(String dateKey) {
    final meals = groupedMealsByDay[dateKey] ?? [];
    return meals.fold(0, (sum, meal) {
      final calories = meal['calories'];
      if (calories is int) return sum + calories;
      if (calories is String) return sum + (int.tryParse(calories) ?? 0);
      return sum;
    });
  }


  @override
  Widget build(BuildContext context) {
    final List<String> sortedDates = groupedMealsByDay.keys.toList();

    sortedDates.sort((a, b) => b.compareTo(a));

    final totalMealsCount = widget.allMeals?.length ?? 0;
    final today = DateTime.now();

    if (totalMealsCount == 0) {
      return Center(
        child: Text(
          'لا يوجد سجل وجبات حتى الآن.',
          style: Appstyles.secondaryStyle,
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 26.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                ),
                child: Center(
                  child: Text(
                    '${totalMealsCount} وجبة',
                    style: Appstyles.gruy12w500style,
                  ),
                ),
              ),
              Text('سجل الوجبات', style: Appstyles.secondaryStyle),
            ],
          ),
          SizedBox(height: 20.h),

          Expanded(
            child: ListView.builder(
              itemCount: sortedDates.length,
              itemBuilder: (context, dateIndex) {
                final dateKey = sortedDates[dateIndex];
                final List<Map<String, dynamic>> mealsOfTheDay =
                    groupedMealsByDay[dateKey]!;

                // تحويل مفتاح التاريخ للعرض
                final DateTime date = DateTime.parse(dateKey);
                final String displayDate =
                    (date.year == today.year &&
                            date.month == today.month &&
                            date.day == today.day)
                        ? 'اليوم'
                        : DateFormat(
                          'EEEE, dd MMM',
                        ).format(date);


                final int dailyCalories = _calculateDailyCalories(dateKey);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('سعرة'),
                            Text('   ${dailyCalories} '),
                            Image.asset(
                              Appimages.Calories,
                              width: 20.w,
                              color: Appcolores.proteinColorText,
                            ),
                          ],
                        ),

                        Text(displayDate!, style: Appstyles.secondaryStyle),
                      ],
                    ),
                    ...mealsOfTheDay.map((meal) {

                      final String calories =
                          (meal['calories'] ?? 0).toString();
                      final String protein = (meal['protein'] ?? 0).toString();
                      final String carbs = (meal['carbs'] ?? 0).toString();
                      final String fats = (meal['fats'] ?? 0).toString();
                      final String name =
                          meal['name']?.toString() ?? 'غير معروفة';
                      final String type =
                          meal['type']?.toString() ?? 'غير محدد';

                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: MealSummaryCard(
                          nameMeal: name,
                          conterType: type,
                          caloriesDaye: calories,
                          protencoent: protein,
                          carpocoent: carbs,
                          fatcoent: fats,
                          // ... (onDelete)
                        ),
                      );
                    }).toList(),
                    const Divider(height: 1.0, thickness: 1.0),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
