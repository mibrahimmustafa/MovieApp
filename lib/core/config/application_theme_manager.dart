import 'package:flutter/material.dart';

class ApplicationThemeManager{
  static const Color primaryColor=Color(0xff1A1A1A);
  static ThemeData darkTheme=ThemeData(
    primaryColor: primaryColor,
    useMaterial3: true,

    appBarTheme:   const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xffFFFFFF)),
      titleTextStyle: TextStyle(
       fontFamily: "Inter",
        fontSize: 14,
        fontWeight: FontWeight.normal,
       color: Color(0xffFFFFFF),

      )
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xffFFBB3B),
      selectedLabelStyle: TextStyle(
        color:  Color(0xffFFBB3B),
        fontFamily: "Inter",
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      selectedIconTheme: IconThemeData(color: Color(0xffFFBB3B)),

      unselectedItemColor: Color(0xffFFFFFF),
      unselectedLabelStyle: TextStyle(
        color: Color(0xffFFFFFF),
        fontFamily: "Inter-Black",
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
      unselectedIconTheme:IconThemeData(color: Color(0xffFFFFFF)),
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily:"Inter",
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontFamily:"Inter",
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontFamily:"Inter",
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily:"Inter",
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily:"Inter",
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily:"Inter",
        fontSize: 8,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontFamily:"Inter",
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        fontFamily:"Inter",
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),

    ),
  );
}