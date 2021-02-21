import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/models/wall8_wallpaper.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_kategori_gambar.dart';

class Wall8Home extends StatefulWidget {
  // variabel
  final List<Wallpaper> listWallpaper;
  // inisialisasi variabel
  Wall8Home({Key key, this.listWallpaper}) : super(key: key);

  @override
  _Wall8HomeState createState() => _Wall8HomeState();
}

class _Wall8HomeState extends State<Wall8Home> {
  final categories = List<String>();
  final categoryImages = List<String>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    widget.listWallpaper.forEach((wallpaper) {
      var category = wallpaper.category;

      if (!categories.contains(category)) {
        categories.add(category);
        categoryImages.add(wallpaper.url);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return InkResponse(
            onTap: () {
              // menampilkan gambar pada kategori
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Wall8Kategori(category: categories.elementAt(index));
              }));
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    categoryImages.elementAt(index),
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                categories.elementAt(index).toUpperCase(),
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    decoration: TextDecoration.combine(
                      [TextDecoration.underline, TextDecoration.overline],
                    ),
                    decorationStyle: TextDecorationStyle.double),
              ),
            ),
          );
        });
  }
}
