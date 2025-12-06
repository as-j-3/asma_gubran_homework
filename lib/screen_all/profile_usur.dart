import 'package:calories_app/screen_all/bode_user.dart';
import 'package:calories_app/styles/app_sttles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../rote/rote_name.dart';
import '../styles/app_colores.dart';
// المفتاح الخاص لجلب بيانات المرتبطه بالامستخدم
const String _DATA_PREFIX = 'user_data_';

class ProfileUsur extends StatefulWidget {
  const ProfileUsur({super.key});

  @override
  State<ProfileUsur> createState() => _ProfileUsurState();
}

class _ProfileUsurState extends State<ProfileUsur> {
  // نعطي قيمه اوليه للمتغيرات
  String? activeUsername;
  String nameUser = 'مستخدم جديد';
  String emilUse = 'loading...';
  int userWeight = 0;
  int userHeight = 0;
  int userAge = 0;
  String userGender = 'N/A';
  String userActivityLevel = 'N/A';
  String userGoal = 'N/A';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }
  // تحميل البيانات بنفس طريقه تخزينهم
  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
// لانه مستخدم الحالي والنشط
    final String? username = prefs.getString('username');

    if (username != null) {
      final String userKey = username;

      final int weight = prefs.getInt('${_DATA_PREFIX}weight_$userKey') ?? 70;
      final int height = prefs.getInt('${_DATA_PREFIX}height_$userKey') ?? 170;
      final int age = prefs.getInt('${_DATA_PREFIX}age_$userKey') ?? 25;
      final String gender =
          prefs.getString('${_DATA_PREFIX}gender_$userKey') ?? 'غير محدد';
      final String activity =
          prefs.getString('${_DATA_PREFIX}activity_$userKey') ?? 'نشاط متوسط';
      final String goal =
          prefs.getString('${_DATA_PREFIX}goal_$userKey') ?? 'الحفاظ على الوزن';


        setState(() {
          // نحدث قيم البيانات
          activeUsername = username;
          emilUse = username;
          nameUser =
              username
                  .split('@')
                  .first;
          userWeight = weight;
          userHeight = height;
          userAge = age;
          userGender = gender;
          userActivityLevel = activity;
          userGoal = goal;
        });
      }




  }
// داله تسجيل الخروج مع ازاله المستخدم النشط
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('isLoggedIn');
      Navigator.pushNamed(
        context,
        Rotename.login_screen,
      );

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 80.w,
                          height: 80.w,
                          decoration: BoxDecoration(
                            color: const Color(0xff33c9ab),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.person_outline_rounded,
                            color: Colors.white,
                            size: 50.sp,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nameUser,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                  size: 15.sp,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  emilUse,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 17.h),
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.edit_calendar, color: Colors.black),
                          Text(
                            'تعديل الملف الشخصي ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 17.h),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                children: [
                  BodeUser(title: 'الوزن', value: '$userWeight', unit: 'كجم'),
                  BodeUser(title: 'الطول', value: '$userHeight', unit: 'سم'),
                  BodeUser(title: 'العمر', value: '$userAge', unit: 'سنة'),
                  BodeUser(title: 'BMR', value: '1600', unit: 'سعرة'),
                ],
              ),
              SizedBox(height: 17.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('معلومات اضافية', style: Appstyles.secondaryStyle),
                      SizedBox(height: 17.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('الجنس', style: Appstyles.secondaryStyle),
                          Text(userGender, style: Appstyles.secondaryStyle),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      const Divider(),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('مستوى النشاط', style: Appstyles.secondaryStyle),
                          Text(
                            userActivityLevel,
                            style: Appstyles.secondaryStyle.copyWith(fontSize:14.sp ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      const Divider(),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('الهدف', style: Appstyles.secondaryStyle),
                          Text(userGoal, style: Appstyles.secondaryStyle),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 17.h),
              ElevatedButton(
                onPressed: _logout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // توسيط المحتوى
                  children: [
                    Icon(Icons.output_sharp, color: Colors.red, size: 24.sp),
                    SizedBox(width: 10.h),
                    const Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

// 💡 ملاحظة: يجب التأكد من تعديل الـ Widget المسمى BodeUser لقبول خصائص مثل title و value و unit.
