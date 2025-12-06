import 'package:calories_app/styles/app_colores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_sttles.dart';

class Faledtext extends StatelessWidget {
  final String? hintext;
  final Widget? sufficon;
  final double? width;
  final bool? ispassword;
  final TextEditingController? textEditingController;
  final String? textUpp;
  final String? Function(String?)? validator;

  const Faledtext({
    super.key,
    this.textUpp,
    this.hintext,
    this.sufficon,
    this.width,
    this.ispassword,
    this.textEditingController,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        width: width ?? 331.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              textUpp ?? '',
              style: Appstyles.primtexsty.copyWith(fontSize: 13),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              textAlign: TextAlign.right,
              controller: textEditingController,
              validator: validator,
              obscureText: ispassword ?? false,
              cursorColor: Appcolores.primrecolor,
              decoration: InputDecoration(

                hintText: hintext ?? '',
                hintStyle: TextStyle(fontSize: 15, color: Color(0xff8391A1)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 18.h,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Color(0xffE8ECF4), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Appcolores.primrecolor,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
                filled: true,
                fillColor: Color(0xffF7F8F9),
                suffixIcon: sufficon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
