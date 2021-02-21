import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/models/wall8_wallpaper.dart';

class Wall8Fav extends StatefulWidget {
  // variabel
  final List<Wallpaper> listWallpaper;

  Wall8Fav({Key key, this.listWallpaper}) : super(key: key);

  @override
  _Wall8FavState createState() => _Wall8FavState();
}

class _Wall8FavState extends State<Wall8Fav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Wallpaper 8\n\nCopyright - 2021',
          style: TextStyle(fontSize: 20.0),
        ),
        
      ),
    );
  }
}
