import 'package:calories_app/rote/rote_name.dart';
import 'package:calories_app/screen/create_account/data_for_body.dart';
import 'package:calories_app/screen/create_account/data_for_sinup.dart';
import 'package:calories_app/wdjets/RichTextt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../../styles/app_colores.dart';
import '../../styles/app_sttles.dart';
import '../../wdjets/logo.dart';

class SinUp extends StatefulWidget {
  const SinUp({super.key});

  @override
  State<SinUp> createState() => _SinUpState();
}

class _SinUpState extends State<SinUp> {
  double isnext = 0;


  String _newUserEmail = '';


  void _onRegistrationSuccess(String email) {
    setState(() {
      _newUserEmail = email;
    });
  }

  Widget _buildCurrentStepWidget() {
    if (isnext == 0) {
      return DataForSinup(
        onChanged: (nextStep) {
          setState(() {
            isnext = nextStep;
          });
        },
        onRegistrationSuccess: _onRegistrationSuccess,
      );
    } else if (isnext == 1) {
      return DataForBody(
        onChanged: (nextStep) {
          setState(() {
            isnext = nextStep;
          });
        },
        newUsername: _newUserEmail,
      );
    } else {
      return const Center(child: Text('خطأ: لم يتم تعريف هذه الخطوة'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolores.sacndcolor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              const Logo(),
              SizedBox(height: 16.h),
              Text(
                'إنشاء حساب جديد',
                style: Appstyles.primtexsty.copyWith(
                  color: Appcolores.primrecolor,
                ),
              ),
              SizedBox(height: 4.h),
              Text('ابدأ رحلتك الصحية اليوم', style: Appstyles.secondaryStyle),
              SizedBox(height: 16.h),
              Directionality(
                textDirection: TextDirection.ltr,
                child: DotsIndicator(
                  dotsCount: 2,
                  position: isnext,
                  decorator: DotsDecorator(
                    color: const Color(0xffE3E9ED),
                    spacing: EdgeInsets.symmetric(horizontal: 4.w),
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: Container(
                  // تم تعديل الارتفاع إلى Expanded للسماح بـ SingleChildScrollView
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
                      child: _buildCurrentStepWidget(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              RichTextt(
                textcolor: 'تسجيل الدخول',
                textnotcolor: 'لديك حساب بالفعل؟',
                onTap: () {
                  Navigator.pushNamed(context, Rotename.login_screen);
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
