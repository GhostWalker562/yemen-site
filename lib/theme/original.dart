import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemes {
  static ThemeData original = ThemeData(
    textTheme: TextTheme(
        bodyText1:
            GoogleFonts.playfairDisplay(fontSize: 24, color: Colors.white),
        headline1:
            GoogleFonts.playfairDisplay(fontSize: 72, color: Colors.white)),
    accentTextTheme: TextTheme(
        bodyText1:
            GoogleFonts.playfairDisplay(fontSize: 24, color: Colors.black)),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
