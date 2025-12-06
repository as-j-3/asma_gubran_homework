import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/app_colores.dart';
import '../../styles/app_images.dart';

class CotmusContanerItme extends StatefulWidget {
  final int rang;
  final String text;
  final Color colorBorder;
  final Color colorBagraound;
  final Color colorAll;
  const CotmusContanerItme({super.key,required this.colorAll,required this.colorBagraound,required this.colorBorder,required this.text,required this.rang});

  @override
  State<CotmusContanerItme> createState() => _CotmusContanerItmeState();
}

class _CotmusContanerItmeState extends State<CotmusContanerItme> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.w,
      height: 154.h,
      decoration:  BoxDecoration(
        border: Border.all(
          color: widget.colorBorder,
        ),
        borderRadius: BorderRadius.circular(20.r),
        color:widget.colorBagraound,
      ),
      child: Padding(
        padding:  EdgeInsets.only(
          top: 20.w,
        ),
        child: Column(
          children: [
            Image.asset(
              Appimages.Calories,
              color: widget.colorAll,
              height: 20.w,
              width: 20.w,
            ),
             SizedBox(height: 22.h),
            Text(
              '${widget.rang} g',
              style: TextStyle(
                  color: widget.colorAll,
                  fontSize: 10
              ),
            ),
            SizedBox(height: 22.h),
             Text(
              widget.text,
              style: TextStyle(
                  color: widget.colorAll,
                  fontSize: 10,
                  fontWeight: FontWeight.bold
              ),)
          ],
        ),
      ),
    );
  }
}
