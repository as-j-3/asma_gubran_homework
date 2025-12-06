import 'dart:async';
import 'package:calories_app/rote/rote_name.dart';
import 'package:flutter/material.dart';

import '../styles/app_colores.dart';
import '../styles/app_images.dart';
import '../styles/app_sttles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamed(context, Rotename.login_screen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolores.primrecolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Appimages.logen),
            const SizedBox(height: 20),
            Text(
              'سعراتك الحرارية',
              style: Appstyles.secondaryStyle.copyWith(
                fontSize: 20,
                color: Appcolores.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
