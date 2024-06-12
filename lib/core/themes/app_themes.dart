import 'package:flutter/material.dart';
import 'package:flutter_journo_blog_app/core/contants/my_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  //light theme
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  //dark theme
  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: MyColors.secondaryColor),
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}
