import 'package:flutter/material.dart';

class ThemeApp {
  static const Color lightPrimre = Color(0xFFB7935F);
  static const Color darkPrimre = Color(0xFF141A2E);
  static const Color white = Color(0xFF707070);
  static const Color black = Color(0xFF242424);
  static const Color gold = Color(0xFFFACC1D);

  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme:IconThemeData(
          color:lightPrimre
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Color(0xFF242424))
      ),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: lightPrimre,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: black,
        unselectedItemColor: white,
        backgroundColor: lightPrimre,
        
      ),
      textTheme: TextTheme(
headlineSmall: TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w400,
  color: black
),
labelLarge: TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400
  ,color: black
)
      ));
      //////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////////////////
      //////////////////////////////////////////////////////
      ///
  static ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: lightPrimre),
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: white)),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: darkPrimre,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: gold,
        unselectedItemColor: white,
        backgroundColor: darkPrimre,
      ),
      textTheme: TextTheme(
          headlineSmall: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w400, color: white),
          labelLarge: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: gold)));
}
