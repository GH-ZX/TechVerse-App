import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light Theme Colors
  static const Color primaryColor = Color(0xFF748CAB);
  static const Color secondaryColor = Color(0xFF3E5C76);
  static const Color accentColor = Color(0xFF1D2D44);
  static const Color backgroundColor = Color(0xFFF0EBD8);
  static const Color cardColor = Color.fromARGB(255, 245, 240, 223);
  static const Color textColor = Color(0xFF0D1321);
  static const Color secondaryTextColor = Color(0xFF1D2D44);
  static const Color dividerColor = Color(0xFFBDBDBD);

  // Dark Theme Colors
  static const Color darkPrimaryColor = Color(0xFF748CAB);
  static const Color darkAccentColor = Color(0xFFA8B5C1);
  static const Color darkBackgroundColor = Color(0xFF0D1321);
  static const Color darkCardColor = Color(0xFF1D2D44);
  static const Color darkSurfaceColor = Color(0xFF1D2D44);
  static const Color darkTextColor = Color(0xFFF0EBD8);
  static const Color darkSecondaryTextColor = Color(0xFF748CAB);
  static const Color darkDividerColor = Color(0xFF3E5C76);
  static const Color darkElevatedColor = Color(0xFF2a3f58);

  // Status Colors
  static const Color errorColor = Color(0xFFD32F2F);
  static const Color successColor = Color(0xFF388E3C);
  static const Color warningColor = Color(0xFFFFA000);
  static const Color infoColor = Color(0xFF1976D2);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      surface: cardColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    cardColor: cardColor,
    dividerColor: dividerColor,
    textTheme: GoogleFonts.cairoTextTheme(ThemeData.light().textTheme).copyWith(
      displayLarge: GoogleFonts.cairo(
        textStyle: const TextStyle(
          color: textColor,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      displayMedium: GoogleFonts.cairo(
        textStyle: const TextStyle(
          color: textColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      displaySmall: GoogleFonts.cairo(
        textStyle: const TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      headlineMedium: GoogleFonts.cairo(
        textStyle: const TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      bodyLarge: GoogleFonts.cairo(
        textStyle: const TextStyle(color: textColor, fontSize: 16),
      ),
      bodyMedium: GoogleFonts.cairo(
        textStyle: const TextStyle(color: textColor, fontSize: 14),
      ),
      bodySmall: GoogleFonts.cairo(
        textStyle: const TextStyle(color: secondaryTextColor, fontSize: 12),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: const BorderSide(color: primaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: dividerColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: dividerColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: errorColor, width: 2),
      ),
    ),
    cardTheme: CardThemeData(
      color: cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: secondaryTextColor,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    colorScheme: ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: darkAccentColor,
      error: errorColor,
      surface: darkSurfaceColor,
      onSurface: darkTextColor,
    ),
    scaffoldBackgroundColor: darkBackgroundColor,
    cardColor: darkCardColor,
    dividerColor: darkDividerColor,
    textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: GoogleFonts.cairo(
        textStyle: const TextStyle(
          color: darkTextColor,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      displayMedium: GoogleFonts.cairo(
        textStyle: const TextStyle(
          color: darkTextColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      displaySmall: GoogleFonts.cairo(
        textStyle: const TextStyle(
          color: darkTextColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      headlineMedium: GoogleFonts.cairo(
        textStyle: const TextStyle(
          color: darkTextColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      bodyLarge: GoogleFonts.cairo(
        textStyle: const TextStyle(color: darkTextColor, fontSize: 16),
      ),
      bodyMedium: GoogleFonts.cairo(
        textStyle: const TextStyle(color: darkTextColor, fontSize: 14),
      ),
      bodySmall: GoogleFonts.cairo(
        textStyle: const TextStyle(color: darkSecondaryTextColor, fontSize: 12),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkCardColor,
      foregroundColor: darkTextColor,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkPrimaryColor,
        foregroundColor: darkBackgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: darkPrimaryColor,
        side: const BorderSide(color: darkPrimaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkSurfaceColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: darkDividerColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: darkDividerColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: darkPrimaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: errorColor, width: 2),
      ),
    ),
    cardTheme: CardThemeData(
      color: darkCardColor,
      shadowColor: Colors.black45,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkCardColor,
      selectedItemColor: darkPrimaryColor,
      unselectedItemColor: darkSecondaryTextColor,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
  );
}
