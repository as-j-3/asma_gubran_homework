import 'dart:convert';
import 'package:calories_app/screen_all/profile_usur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screen_all/add_mael.dart';
import '../../screen_all/statistics.dart';
import '../../styles/app_colores.dart';
import '../../styles/app_sttles.dart';
import 'HistoryScreen.dart';
import 'home_screen.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int currentIndex = 0;
  List<Map<String, dynamic>> addedMeals = [];
  late List<Widget> screens;

  void _addMeal(Map<String, dynamic> meal) {
    setState(() {
      addedMeals.add(meal);
      currentIndex = 0;
    });

    _saveMeals();
  }

  Future<String?> _getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  Future<void> _saveMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = await _getUserId();
    if (userId == null) return;

    final mealsToSave =
        addedMeals.map((meal) {
          final mealCopy = Map<String, dynamic>.from(meal);
          if (mealCopy.containsKey('date') && mealCopy['date'] is DateTime) {
            mealCopy['date'] = (mealCopy['date'] as DateTime).toIso8601String();
          }
          return mealCopy;
        }).toList();

    final jsonString = jsonEncode(mealsToSave);
    await prefs.setString('meals_$userId', jsonString);
  }

  Future<void> _loadMeals() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = await _getUserId();

    if (userId == null) return;

    final key = 'meals_$userId';
    final jsonString = prefs.getString(key);

    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);

      final loadedMeals =
          jsonList.map((item) {
            final Map<String, dynamic> meal = Map<String, dynamic>.from(item);

            if (meal.containsKey('date') && meal['date'] is String) {
              // التحويل من نص ISO إلى DateTime
              meal['date'] = DateTime.parse(meal['date']);
            }
            return meal;
          }).toList();

      if (mounted) {
        setState(() {
          addedMeals = loadedMeals;
        });
      }
    }
  }

  List<Map<String, dynamic>> _getTodayMeals() {
    final today = DateTime.now();
    return addedMeals.where((meal) {
      final mealDate = meal['date'];

      if (mealDate is DateTime) {
        return mealDate.year == today.year &&
            mealDate.month == today.month &&
            mealDate.day == today.day;
      }
      return false;
    }).toList();
  }

  @override
  @override
  void initState() {
    super.initState();
    _loadMeals().then((_) {
      setState(() {});
    });

    screens = [

      HomeScreen(meals: addedMeals),
      HistoryScreen(allMeals: addedMeals),
      AddMael(onAddMeal: _addMeal),
      Statistics(dailyMeals: const []), // placeholder
      ProfileUsur(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    screens[0] = HomeScreen(meals: _getTodayMeals());
    screens[1] = HistoryScreen(
      allMeals: addedMeals,
    );
    screens[3] = Statistics(dailyMeals: _getTodayMeals());

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Appcolores.primrecolor,
            title: Center(
              child: Column(
                children: [
                  Text(
                    'حساب السعرات الحرارية',
                    style: Appstyles.primtexsty.copyWith(
                      color: Appcolores.white,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    'تتبع نظامك الغذائي بسهولة',
                    style: Appstyles.secondaryStyle.copyWith(
                      color: Appcolores.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: screens[currentIndex],
        bottomNavigationBar: Directionality(
          textDirection: TextDirection.rtl,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            backgroundColor: Colors.white,
            elevation: 1,
            selectedItemColor: Appcolores.primrecolor,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: Appstyles.blake15,
            unselectedLabelStyle: Appstyles.gruy12w500style,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, size: 30.sp),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.app_registration_rounded, size: 30.sp),
                label: 'السجل',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 48.sp,
                  height: 48.sp,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Appcolores.primrecolor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 30),
                ),
                label: 'اضافة وجبة',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ev_station_sharp),
                label: 'إحصائيات',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30),
                label: 'الملف',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
