import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colores.dart';
import 'app_sttles.dart';


class Appthame{
  static final lightThame=ThemeData(
      primaryColor: Appcolores.primrecolor,
      scaffoldBackgroundColor: Appcolores.white,
      textTheme: GoogleFonts.cairoTextTheme(
        ThemeData.light().textTheme,
      ).copyWith(
        titleLarge: Appstyles.primtexsty,
        titleMedium: Appstyles.secondaryStyle,
      ),
      buttonTheme: ButtonThemeData(
          buttonColor: Appcolores.primrecolor,
          disabledColor: Appcolores.sacndcolor
      )
  );
}