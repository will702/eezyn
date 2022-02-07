import 'package:flutter/material.dart';
import 'package:new_flutter_template/src/colors_themes/colors.dart';

final ThemeData primaryTheme = ThemeData(
  primaryColor: Colors.indigo,
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: darkColor),
  appBarTheme: const AppBarTheme(color: Colors.indigo),
  buttonTheme: const ButtonThemeData(buttonColor: Colors.indigo),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.indigo,
    ),
  ),
);
