import 'package:flutter/material.dart';

import 'package:seed_flutter_app/core/theme/colors.dart' as colors;

class AppTheme {
  static ThemeData defaultTheme() {
    return ThemeData(
      // primaryColor: colors.wakanda1000,
      // accentColor: colors.lipstick900,
      bottomSheetTheme: BottomSheetThemeData(
          // backgroundColor: colors.wakanda900,
          ),
      fontFamily: 'GoogleSans',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      // appBarTheme: _appBarTheme(),
      // dividerTheme: _dividerThemeData(),
      // scaffoldBackgroundColor: colors.wakanda900,
      // bottomNavigationBarTheme: _bottomNavigationBarThemeData(),
      // iconTheme: _iconThemeData(),
      textTheme: _textTheme(),
      // inputDecorationTheme: _inputDecorationTheme(),
      // buttonTheme: _buttonThemeData(),
      outlinedButtonTheme: _outlinedButtonThemeData(),
      // textButtonTheme: _textButtonThemeData(),
      // cardTheme: _cardTheme(),
    );
  }

  // static CardTheme _cardTheme() {
  //   return CardTheme(
  //     color: colors.wakanda800,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //     ),
  //   );
  // }

  // static TextButtonThemeData _textButtonThemeData() {
  //   return TextButtonThemeData(
  //     style: TextButton.styleFrom(
  //       onSurface: colors.surface400,
  //       primary: colors.surface100,
  //     ),
  //   );
  // }

  static OutlinedButtonThemeData _outlinedButtonThemeData() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 2,
          color: Colors.white,
        ),
        textStyle: TextStyle(
          color: colors.gray,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }

  // static ButtonThemeData _buttonThemeData() {
  //   return ButtonThemeData(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(30.0),
  //     ),
  //     padding: EdgeInsets.symmetric(
  //       vertical: 16,
  //       horizontal: marginSide,
  //     ),
  //     textTheme: ButtonTextTheme.primary,
  //     buttonColor: colors.info,
  //     disabledColor: colors.surface600,
  //   );
  // }

  // static InputDecorationTheme _inputDecorationTheme() {
  //   return InputDecorationTheme(
  //     contentPadding: EdgeInsets.only(bottom: 0),
  //     disabledBorder: UnderlineInputBorder(
  //       borderSide: BorderSide(
  //         color: colors.wakanda100,
  //       ),
  //     ),
  //     enabledBorder: UnderlineInputBorder(
  //       borderSide: BorderSide(
  //         color: colors.wakanda100,
  //       ),
  //     ),
  //     focusedBorder: UnderlineInputBorder(
  //       borderSide: BorderSide(color: colors.info),
  //     ),
  //     floatingLabelBehavior: FloatingLabelBehavior.never,
  //     labelStyle: TextStyle(
  //       color: colors.wakanda500,
  //       fontWeight: FontWeight.w500,
  //       fontSize: 16,
  //     ),
  //     hintStyle: TextStyle(
  //       color: colors.wakanda500,
  //       fontSize: 16.0,
  //       letterSpacing: 0.15,
  //     ),
  //   );
  // }

  static TextTheme _textTheme() {
    return TextTheme(
      headline1: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: colors.darkGreen,
      ),
      headline2: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: colors.darkGreen,
      ),
      // headline4: TextStyle(
      //   fontSize: 24.0,
      //   fontWeight: FontWeight.w600,
      //   color: colors.surface100,
      // ),
      // bodyText2: TextStyle(
      //   fontSize: 14.0,
      //   fontWeight: FontWeight.w500,
      //   color: colors.surface100,
      // ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: colors.gray,
      ),
      subtitle1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: colors.darkGreen,
      ),
      // subtitle1: TextStyle(
      //   fontSize: 16.0,
      //   fontWeight: FontWeight.w500,
      //   color: colors.surface400,
      // ),
      // caption: TextStyle(
      //   fontSize: 12.0,
      //   fontWeight: FontWeight.w500,
      //   color: colors.surface500,
      // ),
      button: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: colors.green,
      ),
      // overline: TextStyle(
      //   fontSize: 12,
      //   fontWeight: FontWeight.w500,
      //   color: colors.surface300,
      // ),
    );
  }

  // static IconThemeData _iconThemeData() {
  //   return IconThemeData(
  //     color: colors.surface400,
  //   );
  // }

  // static BottomNavigationBarThemeData _bottomNavigationBarThemeData() {
  //   return BottomNavigationBarThemeData(
  //     showUnselectedLabels: true,
  //     elevation: 0,
  //     type: BottomNavigationBarType.fixed,
  //     backgroundColor: colors.wakanda1000,
  //     selectedItemColor: colors.surface100,
  //     unselectedItemColor: colors.surface600,
  //     unselectedLabelStyle: TextStyle(fontSize: 11),
  //     selectedLabelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
  //   );
  // }

  // static DividerThemeData _dividerThemeData() {
  //   return DividerThemeData(
  //     color: colors.wakanda400,
  //     space: 0,
  //   );
  // }

  // static AppBarTheme _appBarTheme() {
  //   return AppBarTheme(
  //     elevation: 0,
  //     centerTitle: true,
  //     iconTheme: IconThemeData(
  //       color: colors.surface600,
  //     ),
  //     brightness: Brightness.light,
  //   );
  // }
}
