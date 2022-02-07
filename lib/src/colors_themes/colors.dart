import 'package:flutter/material.dart';

const darkColor = Color(0xff141414);

Color primary(BuildContext context) => Theme.of(context).primaryColor;
Color cardColor(BuildContext context) => Theme.of(context).cardColor;

Color textColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light
      ? Colors.black
      : Colors.white;
}

Color textFieldColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light
      ? Colors.white
      : const Color(0xff212929);
}

Color appBarColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light
      ? Colors.green.shade900
      : const Color(0xff212929);
}

Color homeAppBarColor(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light
      ? primary(context)
      : const Color.fromARGB(255, 211, 55, 81);
}

Color scaffoldBackground(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light
      ? const Color.fromARGB(255, 236, 234, 240)
      : const Color.fromARGB(255, 47, 46, 48);
}
