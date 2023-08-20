import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class myTheme {
  // ignore: avoid_types_as_parameter_names
  static ThemeData lightTheme(BuildContext) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
        color: Colors.deepPurple,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.yellowAccent),
      ));

  static ThemeData darkTheme(BuildContext) => ThemeData(
        brightness: Brightness.dark,
      );

  static Color lightpurple = const Color.fromARGB(221, 237, 220, 239);
  static Color darkblue = const Color.fromARGB(221, 1, 6, 36);
  static Color creamColour = Color.fromARGB(175, 235, 239, 134);
}
