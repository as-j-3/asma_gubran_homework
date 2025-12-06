import 'package:calories_app/styles/app_colores.dart';
import 'package:calories_app/styles/app_images.dart';
import 'package:calories_app/styles/app_sttles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cotmus_contaner_itme.dart';
import 'cotmus_mael.dart';

class HomeScreen extends StatefulWidget {
  final List<Map<String, dynamic>>? meals;

  const HomeScreen({super.key, this.meals});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int caloriesAllowed = 2000;


  int totalCalories = 0;
  int totalProtein = 0;
  int totalCarbs = 0;
  int totalFat = 0;

  List<String> breakfastNames = ['لا يوجد'];
  List<String> lunchNames = ['لا يوجد'];
  List<String> dinnerNames = ['لا يوجد'];
  List<String> snacksNames = ['لا يوجد'];

  List<int> breakfastCalories = [0];
  List<int> lunchCalories = [0];
  List<int> dinnerCalories = [0];
  List<int> snacksCalories = [0];

  int _toInt(dynamic v) {
    if (v == null) return 0;
    if (v is int) return v;
    if (v is double) return v.toInt();
    if (v is String) return int.tryParse(v) ?? 0;
    return 0;
  }


  double get progressRatio {
    final ratio = totalCalories / (caloriesAllowed == 0 ? 1 : caloriesAllowed);
    return ratio.clamp(0.0, 1.0);
  }


  String get remainingText {
    final rem = caloriesAllowed - totalCalories;
    return rem >= 0 ? "متبقي $rem سعرة" : "تجاوزت ${rem.abs()} سعرة";
  }


  void _loadMeals() {
    // إرجاع القيم الافتراضية
    breakfastNames = ['لا يوجد'];
    lunchNames = ['لا يوجد'];
    dinnerNames = ['لا يوجد'];
    snacksNames = ['لا يوجد'];

    breakfastCalories = [0];
    lunchCalories = [0];
    dinnerCalories = [0];
    snacksCalories = [0];

    final meals = widget.meals;
    if (meals == null || meals.isEmpty) {
      _calculateTotals(); // يضع المجاميع على الافتراضي
      return;
    }

    // فصل الوجبات بحسب النوع (آمن لأي قيم غير متوقعة)
    final bMeals = meals.where((m) => (m['type'] ?? '') == 'فطور').toList();
    final lMeals = meals.where((m) => (m['type'] ?? '') == 'غداء').toList();
    final dMeals = meals.where((m) => (m['type'] ?? '') == 'عشاء').toList();
    final sMeals =
        meals.where((m) => (m['type'] ?? '') == 'وجبة خفيفة').toList();

    List<String> _namesFrom(List<Map<String, dynamic>> list) {
      final names =
          list
              .map((m) => (m['name'] ?? '').toString())
              .where((s) => s.isNotEmpty)
              .toList();
      return names.isEmpty ? ['لا يوجد'] : names;
    }

    List<int> _calsFrom(List<Map<String, dynamic>> list) {
      final vals = list.map((m) => _toInt(m['calories'])).toList();
      return vals.isEmpty ? [0] : vals;
    }

    breakfastNames = _namesFrom(bMeals);
    breakfastCalories = _calsFrom(bMeals);

    lunchNames = _namesFrom(lMeals);
    lunchCalories = _calsFrom(lMeals);

    dinnerNames = _namesFrom(dMeals);
    dinnerCalories = _calsFrom(dMeals);

    snacksNames = _namesFrom(sMeals);
    snacksCalories = _calsFrom(sMeals);

    _calculateTotals();
  }


  void _calculateTotals() {
    final bTotal = breakfastCalories.fold(0, (s, x) => s + x);
    final lTotal = lunchCalories.fold(0, (s, x) => s + x);
    final dTotal = dinnerCalories.fold(0, (s, x) => s + x);
    final sTotal = snacksCalories.fold(0, (s, x) => s + x);

    totalCalories = bTotal + lTotal + dTotal + sTotal;


    if (widget.meals == null || widget.meals!.isEmpty) {
      totalProtein = 0;
      totalCarbs = 0;
      totalFat = 0;
    } else {
      totalProtein = widget.meals!.fold(
        0,
        (sum, m) => sum + _toInt(m['protein']),
      );
      totalCarbs = widget.meals!.fold(0, (sum, m) => sum + _toInt(m['carbs']));
      totalFat = widget.meals!.fold(0, (sum, m) => sum + _toInt(m['fats']));
    }

    // force rebuild if needed
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.meals != widget.meals) {
      _loadMeals();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView(
        children: [
          SizedBox(height: 17.h),

          Container(
            padding: EdgeInsets.only(top: 24.h, right: 24.w, left: 24.w),
            width: double.infinity,
            height: 210.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              gradient: LinearGradient(
                colors: [
                  Appcolores.primrecolor,
                  Appcolores.primrecolor2.withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'السعرات اليوم',
                      style: Appstyles.secondaryStyle.copyWith(
                        color: Appcolores.white,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Image.asset(Appimages.Calories, width: 24.w, height: 24.w),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  totalCalories.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'من $caloriesAllowed سعرة حرارية',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                // progress bar
                Container(
                  height: 10.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5ED9B0).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progressRatio,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D121B),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 13.h),
                Text(
                  remainingText,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CotmusContanerItme(
                text: 'بروتين',
                colorAll: Appcolores.proteinColorText,
                colorBagraound: Appcolores.proteinColorBackground,
                colorBorder: Appcolores.proteinColorText.withOpacity(0.4),
                rang: totalProtein,
              ),
              CotmusContanerItme(
                text: 'كربوهيدرات',
                colorAll: Appcolores.carbsColorText,
                colorBagraound: Appcolores.carbsColorBackground,
                colorBorder: Appcolores.carbsColorText.withOpacity(0.4),
                rang: totalCarbs,
              ),
              CotmusContanerItme(
                text: 'دهون',
                colorAll: Appcolores.fatColorText,
                colorBagraound: Appcolores.fatColorBackground,
                colorBorder: Appcolores.fatColorText.withOpacity(0.4),
                rang: totalFat,
              ),
            ],
          ),

          Container(
            width: double.infinity,
            height: 310.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('وجبات اليوم', style: Appstyles.secondaryStyle),
                        SizedBox(width: 8.w),
                        Image.asset(Appimages.food, height: 30.w, width: 30.w),
                      ],
                    ),
                    SizedBox(height: 17.h),
                    CotmusMael(
                      Calorie: breakfastCalories,
                      meal: breakfastNames,
                      mealtype: 'الإفطار',
                    ),
                    SizedBox(height: 10.h),
                    CotmusMael(
                      Calorie: lunchCalories,
                      meal: lunchNames,
                      mealtype: 'الغداء',
                    ),
                    SizedBox(height: 10.h),
                    CotmusMael(
                      Calorie: dinnerCalories,
                      meal: dinnerNames,
                      mealtype: 'العشاء',
                    ),
                    SizedBox(height: 10.h),
                    CotmusMael(
                      Calorie: snacksCalories,
                      meal: snacksNames,
                      mealtype: 'وجبة خفيفة',
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 17.h),
        ],
      ),
    );
  }
}
