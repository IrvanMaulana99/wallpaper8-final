import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/models/wall8_wallpaper.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_galeri.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_home1.dart';

class Wall8Kategori extends StatefulWidget {
  final String category;

  Wall8Kategori({Key key, @required this.category}) : super(key: key);

  @override
  _Wall8KategoriState createState() => _Wall8KategoriState();
}

class _Wall8KategoriState extends State<Wall8Kategori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper 8'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Wall8Home1()));
            },
          )
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('databasegambar')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var wallpapers =
                  _getWallpaperOfCurrentCategory(snapshot.data.docs);

              return ListView.builder(
                itemCount: wallpapers.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: InkResponse(
                      onTap: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Wall8Gallery(
                                listWallpaper: wallpapers, pageAwal: index),
                          ),
                        );
                      },
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        height: 200.0,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              wallpapers.elementAt(index).url,
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                            color: Color(Theme.of(context)
                                    .textTheme
                                    .caption
                                    .color
                                    .value ^
                                0xffffff),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  wallpapers.elementAt(index).name,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  List<Wallpaper> _getWallpaperOfCurrentCategory(
      List<QueryDocumentSnapshot> docs) {
    var list = List<Wallpaper>();
    docs.forEach((document) {
      var wallpaper = Wallpaper.fromDocumentSnapshot(document);
      if (wallpaper.category == widget.category) {
        list.add(wallpaper);
      }
    });
    return list;
  }
}
