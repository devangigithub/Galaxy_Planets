
import 'package:anim/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        initialRoute: "/",
        routes: {
          "home_screen":(context){return PlanetListScreen() ;},
          "/":(context){return SplashScreen();},
        },
      ),
  );
}



