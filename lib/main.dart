// main class
// import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/Welcome/welcome_screen.dart';
import 'package:wallpaper8_kelompok8/Screens/halaman%20onboard/wall8onboard.dart';
import 'package:wallpaper8_kelompok8/Screens/splash/splash_screen.dart';
import 'package:wallpaper8_kelompok8/constants.dart';

void main() async {
  await _initApp();
  runApp(MyApp());
}

Future _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper 8',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Color(0xFF6F35A5),
          ),
        ),
      ),
      // halaman pertama
      initialRoute: SplashScreen.id,
      // rute halaman
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        Wall8Onboard.id: (context) => Wall8Onboard(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
      },
      // home: WelcomeScreen(),
    );
  }
}
