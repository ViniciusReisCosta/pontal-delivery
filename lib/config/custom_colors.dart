import 'package:flutter/material.dart';


Map<int, Color> _swatchOpacity = {

  50: Color(0xFFFFEDE6),
  100: Color(0xFFFFD1BF),
  200: Color(0xFFFFB399),
  300: Color(0xFFFF9572),
  400: Color(0xFFFF7A4D),
  500: Color(0xFFF74601), // Cor principal
  600: Color(0xFFE04000),
  700: Color(0xFFCC3900),
  800: Color(0xFFB83300),
  900: Color(0xFF992800),
};

abstract class CustomColors {

  static Color customConstrastColor = Colors.red.shade700;

  static MaterialColor customSwatchColor = MaterialColor(0xFF8BC34A,_swatchOpacity);
}