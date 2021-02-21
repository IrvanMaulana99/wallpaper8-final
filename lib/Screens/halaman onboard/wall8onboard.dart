import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wallpaper8_kelompok8/Screens/Welcome/welcome_screen.dart';
import 'package:wallpaper8_kelompok8/Screens/halaman%20onboard/wall8button.dart';

class Wall8Onboard extends StatelessWidget {
  static const String id = "wall8onboard";

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Kumpulan Wallpaper Menarik',
              body: 'Tersedia banyak wallpaper menarik.',
              image: buildImage('assets/images/kumpulan-gambar.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Atur Wallpaper',
              body:
                  'Tersedia beberapa kategori gambar, atur wallpaper yang menurutmu menarik.',
              image: buildImage('assets/images/terapkan-gambar.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Download Gambar ke Handphone',
              body: 'Gambar yang menarik bisa di Download dan ditandai.',
              image: buildImage('assets/images/download-gambar.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Atur ukuran Gambar',
              body: 'Atur sisi wallpaper yang akan diterapkan.',
              footer: ButtonWidget(
                text: 'Mulai',
                onClicked: () => goToHome(context),
              ),
              image: buildImage('assets/images/atur-gambar.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('Login', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Lewati'),
          onSkip: () => goToHome(context),
          next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).primaryColor,
          skipFlex: 0,
          nextFlex: 0,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => WelcomeScreen()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFF6F35A5),
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
