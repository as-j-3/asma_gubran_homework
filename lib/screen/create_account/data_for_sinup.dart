import 'dart:convert'; // 🔑 جديد: للتعامل مع JSON
import 'package:calories_app/wdjets/faledtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../styles/app_colores.dart';
import '../../wdjets/PrimaryButtem.dart';

// المفتاح الموحد الذي سيحمل قاموس بيانات اعتماد جميع المستخدمين
const String _ALL_CREDENTIALS_KEY = 'all_user_credentials';

class DataForSinup extends StatefulWidget {
  final void Function(double) onChanged;

  // 💡 الخاصية الجديدة: دالة لتمرير البريد الإلكتروني عند النجاح
  final void Function(String email) onRegistrationSuccess;

  const DataForSinup({
    super.key,
    required this.onChanged,
    required this.onRegistrationSuccess, // يتم استخدامها لتمرير البريد
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

  Future<void> _saveNewRegistrationData({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final String trimmedEmail = email.trim();
    final String trimmedPassword = password.trim();
    final String? existingJson = prefs.getString(_ALL_CREDENTIALS_KEY);

    Map<String, dynamic> credentialsMap = {};
    if (existingJson != null) {
      try {
        final decoded = json.decode(existingJson);
        if (decoded is Map<String, dynamic>) {
          credentialsMap = decoded;
        }
      } catch (e) {
        print('Error decoding existing credentials: $e');
      }
    }

    credentialsMap[trimmedEmail] = trimmedPassword;

    final newJson = json.encode(credentialsMap);
    await prefs.setString(_ALL_CREDENTIALS_KEY, newJson);

    await prefs.remove('saved_email');
    await prefs.remove('saved_password');
    await prefs.setBool('isRegistered', true);
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

                await _saveNewRegistrationData(
                  email: userEmail,
                  password: passwordController.text,
                );

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
