import 'package:calories_app/rote/rote_name.dart';
import 'package:calories_app/screen/SplashScreen.dart';
import 'package:calories_app/screen/create_account/sin_up.dart';
import 'package:calories_app/screen/login_screen.dart';
import 'package:calories_app/screen/main_screen/home_screen.dart';
import 'package:calories_app/screen/main_screen/main_screen.dart';
import 'package:calories_app/styles/Appthame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Appthame.lightThame,
          initialRoute: Rotename.SplashScreen,

          routes: {
            Rotename.SplashScreen: (context) => const SplashScreen(),
            Rotename.login_screen : (context) => const LoginScreen (),
            Rotename.SinUp : (context) => const SinUp (),
            Rotename.HomeScreen : (context) => const HomeScreen (),
            Rotename.Mainscreen : (context) => const Mainscreen (),

          },
        );
      },
    );
  }
}
