import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: camel_case_types
class myTheme {
  // ignore: avoid_types_as_parameter_names
  static ThemeData lightTheme(BuildContext) => ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: creamColour,
      canvasColor: lightpurple,
      highlightColor: Colors.deepPurple,
      hintColor: Colors.black,
      appBarTheme: const AppBarTheme(
        color: Colors.deepPurple,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
      ));

  static ThemeData darkTheme(BuildContext) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: darkblue,
        canvasColor: darkpurple,
        hintColor: Colors.white,
        highlightColor: lightBluishColor,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.deepPurple),
        ),
      );

  static Color lightpurple = const Color.fromARGB(221, 237, 220, 239);
  static Color darkpurple = Vx.gray800;
  static Color darkblue = const Color.fromARGB(221, 1, 6, 36);
  static Color creamColour = const Color.fromARGB(175, 235, 239, 134);
  static Color lightBluishColor = Colors.indigo;
}
