import 'package:calories_app/wdjets/PrimaryButtem.dart';
import 'package:calories_app/wdjets/numbrek.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../rote/rote_name.dart';
import '../../styles/app_colores.dart';
import '../../styles/app_sttles.dart';
import '../../wdjets/AppConstants.dart';
import '../../wdjets/ReusableDropdown.dart';

const String _DATA_PREFIX = 'user_data_';

class DataForBody extends StatefulWidget {
  final void Function(double) onChanged;

  final String newUsername;

  const DataForBody({
    super.key,
    required this.onChanged,
    required this.newUsername,
  });

  @override
  State<DataForBody> createState() => _DataForBodyState();
}

class _DataForBodyState extends State<DataForBody> {
  int userWeight = 70;
  int userHeight = 175;
  int userAge = 25;
  String? selectedGender;
  String? selectedGoal;
  String? selectedActivityLevel;

  Future<void> _createNewUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    final String userKey = widget.newUsername;
    await prefs.setInt('${_DATA_PREFIX}weight_$userKey', userWeight);
    await prefs.setInt('${_DATA_PREFIX}height_$userKey', userHeight);
    await prefs.setInt('${_DATA_PREFIX}age_$userKey', userAge);
    await prefs.setString(
      '${_DATA_PREFIX}gender_$userKey',
      selectedGender ?? 'N/A',
    );
    await prefs.setString(
      '${_DATA_PREFIX}activity_$userKey',
      selectedActivityLevel ?? 'N/A',
    );
    await prefs.setString(
      '${_DATA_PREFIX}goal_$userKey',
      selectedGoal ?? 'N/A',
    );

    await prefs.setString('username', userKey);
    await prefs.setBool('isLoggedIn', true);

    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Rotename.Mainscreen,
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('الوزن (كجم)', style: Appstyles.secondaryStyle),
                SizedBox(height: 5),
                Numbrek(
                  initialValue: userWeight,
                  onChanged: (newWeight) {
                    setState(() {
                      userWeight = newWeight;
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                Text('الطول (سم)', style: Appstyles.secondaryStyle),
                SizedBox(height: 5),
                Numbrek(
                  initialValue: userHeight,
                  onChanged: (newHeight) {
                    setState(() {
                      userHeight = newHeight;
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                Text('العمر', style: Appstyles.secondaryStyle),
                SizedBox(height: 5),
                Numbrek(
                  initialValue: userAge,
                  onChanged: (newAge) {
                    setState(() {
                      userAge = newAge;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.h),
        ReusableDropdown(
          hintText: 'اختر الجنس',
          selectedValue: selectedGender,
          items: AppConstants.availableGenders,
          onChanged: (newValue) {
            setState(() {
              selectedGender = newValue;
            });
          },
        ),
        SizedBox(height: 20.h),
        ReusableDropdown(
          hintText: 'اختر مستوى النشاط',
          selectedValue: selectedActivityLevel,
          items: AppConstants.activityLevels,
          onChanged: (newValue) {
            setState(() {
              selectedActivityLevel = newValue;
            });
          },
        ),
        SizedBox(height: 20.h),
        ReusableDropdown(
          hintText: 'هدفـك',
          selectedValue: selectedGoal,
          items: AppConstants.goals,
          onChanged: (newValue) {
            setState(() {
              selectedGoal = newValue;
            });
          },
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryButtem(
              text: 'إنشاء حساب',
              width: 130.w,
              onPressed: _createNewUserSession,
            ),
            PrimaryButtem(
              text: 'رجوع',
              width: 130.w,
              onPressed: () {
                widget.onChanged(0);
              },
              color: Appcolores.white,
              textcolor: Appcolores.primrecolor,
            ),
          ],
        ),
      ],
    );
  }
}
