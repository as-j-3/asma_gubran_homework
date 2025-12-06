import 'dart:convert'; // 🔑 جديد: للتعامل مع JSON
import 'package:calories_app/rote/rote_name.dart';
import 'package:calories_app/styles/app_colores.dart';
import 'package:calories_app/styles/app_images.dart';
import 'package:calories_app/styles/app_sttles.dart';
import 'package:calories_app/wdjets/PrimaryButtem.dart';
import 'package:calories_app/wdjets/faledtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../wdjets/RichTextt.dart';
import '../wdjets/logo.dart';

// المفتاح الموحد الذي يحمل قاموس بيانات اعتماد جميع المستخدمين (يجب أن يكون مطابقاً لما في DataForSinup)
const String _ALL_CREDENTIALS_KEY = 'all_user_credentials';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final forkey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late bool _darkModeEnabled = false;

  bool isChecked = false;

  // 🔑 تم تعديل الدالة: للتحقق من بيانات الاعتماد من قاموس JSON
  Future<void> _loginUser() async {
    final prefs = await SharedPreferences.getInstance();
    final enteredEmail = emailController.text.trim();
    final enteredPassword = passwordController.text.trim();


    final String? existingJson = prefs.getString(_ALL_CREDENTIALS_KEY);

    Map<String, dynamic> credentialsMap = {};
    if (existingJson != null) {
      try {
        final decoded = json.decode(existingJson);
        if (decoded is Map<String, dynamic>) {
          credentialsMap = decoded;
        }
      } catch (e) {
        print('Error decoding credentials on login: $e');

      }
    }


    final String? savedPassword = credentialsMap[enteredEmail];

    if (savedPassword != null && enteredPassword == savedPassword) {

      await prefs.setString('username', enteredEmail);
      await prefs.setBool('isLoggedIn', true);

      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Rotename.Mainscreen,
          (route) => false,
        );
      }
    } else {

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'البريد الإلكتروني أو كلمة المرور غير صحيحة. يرجى التحقق.',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolores.sacndcolor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: forkey,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                const Logo(),
                SizedBox(height: 16.h),
                Text(
                  'حساب السعرات الحرارية',
                  style: Appstyles.primtexsty
                ),
                SizedBox(height: 8.h),
                Text('مرحباً بك مجدداً', style: Appstyles.secondaryStyle),
                SizedBox(height: 32.h),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Appcolores.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 20.h),
                            Faledtext(
                              textEditingController: emailController,
                              textUpp: 'البريد الالكتروني',

                              hintext: 'exaple@gmail.com',
                              validator: (values) {
                                if (values == null ||
                                    values.isEmpty)
                                  return "ادخل بريدك الالكتروني";
                                return null;
                              },
                              sufficon: Icon(
                                Icons.email_outlined,
                                color: Appcolores.primrecolor,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Faledtext(
                              textEditingController: passwordController,
                              validator: (values) {
                                if (values == null ||
                                    values.length <
                                        8)
                                  return "يجب أن تكون كلمة المرور 8 أحرف على الأقل";
                                return null;
                              },
                              textUpp: 'كلمة المرور',
                              // تم حذف width: 311.w
                              hintext: '*********',
                              sufficon: Icon(
                                Icons.lock,
                                color: Appcolores.primrecolor,
                              ),
                              ispassword: true,
                            ),
                            SizedBox(height: 15.h),
                            PrimaryButtem(
                              text: 'تسجيل الدخول',
                              onPressed: () {
                                if (forkey.currentState!.validate()) {
                                  _loginUser();
                                }
                              },
                            ),
                            SizedBox(height: 3.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'نسيت كلمة المرور',
                                  style: Appstyles.primtexsty.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'تذكرني',
                                      style: Appstyles.secondaryStyle,
                                    ),

                                    Checkbox(
                                      activeColor: Appcolores.primrecolor,
                                      value: isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = value ?? false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Text(
                                    'او',
                                    style: Appstyles.secondaryStyle,
                                  ),
                                ),
                                const Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              // تم حذف width: 311.w
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Appcolores.white,
                                border: Border.all(
                                  color: const Color(0xFFE0E0E0),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(' Gogoole تسجيل الدخول بواسطة '),

                                    SvgPicture.asset(
                                      Appimages.google,
                                      height: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                RichTextt(
                  onTap: () {
                    Navigator.pushNamed(context, Rotename.SinUp);
                  },
                  textnotcolor: 'ليس لديك حساب؟',
                  textcolor: ' إنشاء حساب جديد',
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
