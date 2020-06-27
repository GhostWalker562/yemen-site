import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemes {
  static ThemeData original = ThemeData(
    textTheme: TextTheme(
      bodyText1: GoogleFonts.playfairDisplay(fontSize: 24, color: Colors.white),
      bodyText2: GoogleFonts.playfairDisplay(fontSize: 32, color: Colors.white),
      headline1: GoogleFonts.playfairDisplay(fontSize: 72, color: Colors.white),
      headline2: GoogleFonts.oswald(
          fontSize: 36,
          color: Colors.white,
          height: 1.8,
          fontWeight: FontWeight.w300),
      headline3: GoogleFonts.oswald(
          fontSize: 24,
          color: Colors.black,
          height: 1.8,
          fontWeight: FontWeight.w300),
    ),
    accentTextTheme: TextTheme(
      bodyText1: GoogleFonts.playfairDisplay(fontSize: 24, color: Colors.black),
      bodyText2: GoogleFonts.playfairDisplay(fontSize: 32, color: Colors.black),
      headline1: GoogleFonts.playfairDisplay(fontSize: 72, color: Colors.black),
    ),
    primaryTextTheme: TextTheme(
      bodyText1: GoogleFonts.playfairDisplay(fontSize: 16, color: Colors.black),
      bodyText2: GoogleFonts.playfairDisplay(fontSize: 24, color: Colors.red),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
