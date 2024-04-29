import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_pallete.dart';

class AppTheme {
  static final Thememode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: AppBarTheme(
        backgroundColor: AppPallete.backgroundColor, scrolledUnderElevation: 0),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: GoogleFonts.poppins().copyWith(fontSize: 10, color: AppPallete.color1),
      unselectedLabelStyle: GoogleFonts.poppins().copyWith(fontSize: 10, color: AppPallete.dropsShadow),
      unselectedItemColor: AppPallete.color2,
      selectedItemColor: AppPallete.color1
    ),
  );
}
