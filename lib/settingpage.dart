import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task3/card.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Cards(dscrbthen: 'تغير الاعدادات اللازمه', text: 'اعدادات عامه', Iconss:Icons.settings_outlined)
        ],
      ),
    );
  }
}
