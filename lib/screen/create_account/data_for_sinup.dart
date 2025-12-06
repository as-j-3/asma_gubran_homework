import 'dart:convert'; // 🔑 جديد: للتعامل مع JSON
import 'package:calories_app/wdjets/faledtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../styles/app_colores.dart';
import '../../wdjets/PrimaryButtem.dart';

//هدا عبار عن المفتاح لكل المستخدمين المسجلين في التطبيق
const String _ALL_CREDENTIALS_KEY = 'all_user_credentials';

class DataForSinup extends StatefulWidget {
  // الداله الاول ترجع له متغير لينقل للصفحه التاليه
  // الداله الثانيه ترجع له المستخدم النشط
  final void Function(double) onChanged;
  final void Function(String email) onRegistrationSuccess;

  const DataForSinup({
    super.key,
    required this.onChanged,
    required this.onRegistrationSuccess,
  });

  @override
  State<DataForSinup> createState() => _DataForSinupState();
}

class _DataForSinupState extends State<DataForSinup> {
  final forkey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
// داله تقوم بحفظ البريد والباسورد في الشير رفيرينس
  Future<void> _saveNewRegistrationData({required String email, required String password,}) async {
    final prefs = await SharedPreferences.getInstance();
    // نتاكد من ازاله اي مسافه زائده
    final String trimmedEmail = email.trim();
    final String trimmedPassword = password.trim();
    //نجلب جميع السستخدين لانه ميزنا جميع المستخدمين بمفتاح
    final String? existingJson = prefs.getString(_ALL_CREDENTIALS_KEY);

    Map<String, dynamic> credentialsMap = {};

    if (existingJson != null) {
      // اذا يوجد مستخدمين حولهم الى map ويتم تخزينهم في ال map الجديده
        final decoded = json.decode(existingJson);
          credentialsMap = decoded;
    }
    // يتم اضافه المستخدم الجديد في ال map
    credentialsMap[trimmedEmail] = trimmedPassword;
//  يتم تحويل ال map  الى صيغه json ليتم تخزينها في الشير رفينيس
    final newJson = json.encode(credentialsMap);
    // يخزن المفتاح مع بيانات المستخدم الجديد
    await prefs.setString(_ALL_CREDENTIALS_KEY, newJson);

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forkey,
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Faledtext(
            textUpp: 'الاسم الكامل',
            sufficon: Icon(Icons.person, color: Appcolores.primrecolor),
            hintext: 'ادخل اسمك الكامل ',
          ),
          SizedBox(height: 16.h),
          Faledtext(
            textEditingController: emailController,
            textUpp: 'البريد الالكتروني',
            hintext: 'example@gmail.com',
            sufficon: Icon(Icons.email_outlined, color: Appcolores.primrecolor),
            validator: (values) {
              if (values == null || values.isEmpty)
                return "ادخل بريدك الالكتروني";
              return null;
            },
          ),
          SizedBox(height: 16.h),
          Faledtext(
            textEditingController: passwordController,
            textUpp: 'كلمة المرور',
            hintext: '*********',
            sufficon: Icon(Icons.lock, color: Appcolores.primrecolor),
            ispassword: true,
            validator: (values) {
              if (values == null || values.length < 8)
                return "يجب أن تكون كلمة المرور 8 أحرف على الأقل";
              return null;
            },
          ),
          SizedBox(height: 16.h),
          Faledtext(
            textUpp: ' تاكيد كلمة المرور',
            hintext: '*********',
            sufficon: Icon(Icons.lock, color: Appcolores.primrecolor),
            ispassword: true,
            validator: (values) {
              if (values != passwordController.text)
                return "كلمتا المرور غير متطابقتين";
              return null;
            },
          ),
          SizedBox(height: 15.h),
          PrimaryButtem(
            text: 'التالي',
            onPressed: () async {
              if (forkey.currentState!.validate()) {
                final String userEmail = emailController.text.trim();
                //يتم استدعاء الداله للاضافة
                await _saveNewRegistrationData(
                  email: userEmail,
                  password: passwordController.text,
                );
                // يتم استدعاها لتمرير المستخدم الحالي
                widget.onRegistrationSuccess(userEmail);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'تم تسجيل البيانات بنجاح. أكمل معلومات الجسم.',
                    ),
                  ),
                );

                widget.onChanged(1);
              }
            },
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
