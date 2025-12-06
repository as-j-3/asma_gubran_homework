import 'package:calories_app/styles/app_colores.dart';
import 'package:calories_app/styles/app_sttles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class RichTextt extends StatelessWidget {
  final String? textnotcolor;
  final String? textcolor;
  final void Function()? onTap;

  const RichTextt({super.key,this.onTap,this.textcolor,this.textnotcolor});

  @override
  Widget build(BuildContext context) {
    return       Center(
      child: RichText(
        text: TextSpan(
          text: textnotcolor,
          style: Appstyles.secondaryStyle.copyWith(
            color: const Color(0xff202955)
          ),
          children: [
            TextSpan(
              text: textcolor,
              style: Appstyles.secondaryStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: Appcolores.primrecolor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
