import 'package:app_movie/src/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ConfigColor.dark,
    colorScheme: const ColorScheme.dark(
      primary: ConfigColor.subPrimary,
      secondary: ConfigColor.light,
      onPrimary: ConfigColor.primary,
    ),
    iconTheme: const IconThemeData(
      color: ConfigColor.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ConfigColor.subDark,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: ConfigWeight.bold,
        color: ConfigColor.light,
      ),
      titleSpacing: 0,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.inter(
        fontSize: 22,
        color: ConfigColor.light,
        fontWeight: ConfigWeight.bold,
      ),
      headline2: GoogleFonts.inter(
        fontSize: 20,
        color: ConfigColor.light,
        fontWeight: ConfigWeight.bold,
      ),
      headline3: GoogleFonts.inter(
        fontSize: 20,
        color: ConfigColor.light,
        fontWeight: ConfigWeight.regular,
      ),
      headline4: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: ConfigWeight.bold,
        color: ConfigColor.light,
      ),
      headline5: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: ConfigWeight.regular,
        color: ConfigColor.light,
      ),
      // headline6: GoogleFonts.inter(
      //   fontSize: 14,
      //   fontWeight: ConfigWeight.bold,
      //   color: ConfigColor.light,
      // ),
      // bodyLarge: GoogleFonts.poppins(
      //   fontSize: 16,
      //   fontWeight: ConfigWeight.bold,
      //   color: ConfigColor.light,
      // ),
      // bodyMedium: GoogleFonts.poppins(
      //   fontSize: 16,
      //   fontWeight: ConfigWeight.medium,
      //   color: ConfigColor.light,
      // ),
      // bodySmall: GoogleFonts.poppins(
      //   fontSize: 16,
      //   fontWeight: ConfigWeight.regular,
      //   color: ConfigColor.light,
      // ),
      bodyText1: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: ConfigWeight.bold,
        color: ConfigColor.light,
      ),
      bodyText2: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: ConfigWeight.medium,
        color: ConfigColor.light,
      ),
      subtitle1: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: ConfigWeight.regular,
        color: ConfigColor.light,
      ),
      subtitle2: GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: ConfigWeight.regular,
        color: ConfigColor.light,
      ),
    ),
  );
}
