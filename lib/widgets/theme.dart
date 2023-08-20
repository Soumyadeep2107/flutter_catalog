import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class myTheme {
  // ignore: avoid_types_as_parameter_names
  static ThemeData lightTheme(BuildContext) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: const AppBarTheme(
        color: Colors.deepPurple,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.yellowAccent),
      ));

  static ThemeData darkTheme(BuildContext) => ThemeData(
        brightness: Brightness.dark,
      );
}
