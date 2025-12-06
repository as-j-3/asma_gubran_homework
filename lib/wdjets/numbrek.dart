import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';

import '../styles/app_colores.dart';
import '../styles/app_sttles.dart';

class Numbrek extends StatefulWidget {
  final void Function(int)? onChanged;
  final int initialValue;

  const Numbrek({super.key, this.onChanged,this.initialValue=3});

  @override
  State<Numbrek> createState() => _NumbrekState();
}

class _NumbrekState extends State<Numbrek> {
  late int _currentValue ;
  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: NumberPicker(
        value: _currentValue,
        minValue: 0,
        maxValue: 300,
        textStyle: Appstyles.secondaryStyle.copyWith(color: Colors.grey),
        selectedTextStyle: Appstyles.primtexsty.copyWith(
          color: Appcolores.primrecolor,
          fontSize: 20.sp,
        ),
        itemHeight: 30.h,
        onChanged: (value) {
          _currentValue = value;
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}
