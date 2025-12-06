import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colores.dart';
import '../styles/app_images.dart';

class Logo  extends StatelessWidget {
  const Logo ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80.w,
        width: 80.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Appcolores.primrecolor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Image.asset(
          Appimages.logen,
          height: 40.w,
          width: 40.w,
        ),
      ),
    );
  }
}
