import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/models/wall8_wallpaper.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_galeri.dart';

class Wall8Img extends StatefulWidget {
  // variabel
  final List<Wallpaper> listWallpaper;

  Wall8Img({Key key, this.listWallpaper}) : super(key: key);

  @override
  _Wall8ImgState createState() => _Wall8ImgState();
}

class _Wall8ImgState extends State<Wall8Img> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.listWallpaper.length,
      itemBuilder: (BuildContext context, int index) {
        debugPrint(widget.listWallpaper.elementAt(index).name);
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: GridTile(
            child: InkResponse(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Wall8Gallery(
                        listWallpaper: widget.listWallpaper,
                        pageAwal: index,
                      );
                    },
                  ),
                );
              },
              child: CachedNetworkImage(
                imageUrl: widget.listWallpaper.elementAt(index).url,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
