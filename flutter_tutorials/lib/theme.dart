import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorials/pages/custom_color_scheme.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.teal,
    primaryColorDark: Colors.teal,
    scaffoldBackgroundColor: Colors.teal,
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.teal,
        size: 20,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      bodySmall: TextStyle(
        color: Colors.black54,
        fontSize: 16.0,
      ),
    ),
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.light,
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black26,
    primarySwatch: Colors.teal,
    primaryColor: Colors.teal,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 20,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    ),
    extensions: const <ThemeExtension<dynamic>>[
      MyColors.dark,
    ],
  );
}
