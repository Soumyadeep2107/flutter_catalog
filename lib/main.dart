import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp()); // runApp is a widget which gives us the
}

//  we got this class by just typing stl(stateless widget)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // in fluter 90 percent things are in widget form
    //data types.
    // const days = 30;
    // const String name = "Soumyadeep";
    // MaterialApp widget will not give us the time, notifications in the top of the app but the Saffold widget will give us.
    return MaterialApp(
      // home: Homepage(), //that is why we have commented it.
      // theme: ThemeData(
      //   primarySwatch: Colors
      //       .indigo, //basically theme data will help to change the theme color according to it.
      //   fontFamily: GoogleFonts.lato()
      //       .fontFamily, //here we have use the google fonts whose pulgin we have include in pubspec file and also imported the file also in the main file.
      // ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: myTheme.lightTheme(context),
      darkTheme: myTheme.darkTheme(context),

      // themeMode: ThemeMode.light,
      // darkTheme: ThemeData(
      //   brightness: Brightness.light,
      // ),
      initialRoute:
          "/", //since by default the home route is acessed we change the default setting by giving the default thing as "/home"
      routes: {
        "/": (context) => Homepage(), //since "/" tells the home route only.
        // using this made class from route.dart help us route through other files so that we don't need to specify the route in the home route "/".
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoutes: (context) => Homepage(),
      },
    );
  }
}
