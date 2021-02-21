// halaman splash screen
import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/halaman%20onboard/wall8onboard.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  // id untuk halaman splash screen
  static const String id = "splash_screen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;
  // waktu tampil splash screen ( 7 Detik) memakai timer
  removeScreen() {
    return _timer = Timer(Duration(seconds: 7), () {
      Navigator.of(context).pushReplacementNamed(Wall8Onboard.id);
    });
  }

  @override
  void initState() {
    super.initState();
    removeScreen();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // warna background
      backgroundColor: Theme.of(context).primaryColor,
      // gambar splash screen
      body: Center(
        child: Image(
          width: 150,
          image: AssetImage(
            "assets/images/splash logo tubes.png",
          ),
        ),
      ),
    );
  }
}
