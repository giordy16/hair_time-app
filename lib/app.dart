import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hair_time/ui/splash/Splash.dart';

class App extends StatelessWidget {
  final String flavor;

  const App({
    Key? key,
    required this.flavor,
  }) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    return MaterialApp(
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
        home: Splash());
  }

  ThemeData appTheme() {
    return ThemeData(
      fontFamily: GoogleFonts.raleway().fontFamily,
    );
  }
}
