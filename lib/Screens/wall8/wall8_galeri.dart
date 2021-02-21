import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:wallpaper8_kelompok8/Screens/models/wall8_wallpaper.dart';
import 'package:wallpaper8_kelompok8/Screens/wall8/wall8_pilihan.dart';

class Wall8Gallery extends StatefulWidget {
  final List<Wallpaper> listWallpaper;

  final int pageAwal;

  Wall8Gallery({Key key, @required this.listWallpaper, @required this.pageAwal})
      : super(key: key);

  @override
  _Wall8GalleryState createState() => _Wall8GalleryState();
}

class _Wall8GalleryState extends State<Wall8Gallery> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.pageAwal);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Stack(children: [
            PhotoViewGallery.builder(
              pageController: _pageController,
              itemCount: widget.listWallpaper.length,
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: CachedNetworkImageProvider(
                    widget.listWallpaper.elementAt(index).url,
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 100.0,
                  color: Color(IconTheme.of(context).color.value ^ 0xffffff),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.file_download),
                        onPressed: () async {
                          var status = await Permission.storage.request();
                          if (status.isGranted) {
                            try {
                              var imageId = await ImageDownloader.downloadImage(
                                widget.listWallpaper
                                    .elementAt(
                                      _pageController.page.toInt(),
                                    )
                                    .url,
                                destination:
                                    AndroidDestinationType.directoryPictures,
                              );

                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Download Selesai'),
                                  action: SnackBarAction(
                                      label: 'Buka',
                                      onPressed: () async {
                                        var path =
                                            await ImageDownloader.findPath(
                                                imageId);
                                        await ImageDownloader.open(path);
                                      }),
                                ),
                              );
                            } on PlatformException catch (error) {
                              print(error);
                            }
                          } else {
                            showDialog(
                                context: context,
                                child: AlertDialog(
                                  title: Text('Butuh Akses ke penyimpanan'),
                                  actions: [
                                    FlatButton(
                                      child:  Text('Buka Pengaturan'),
                                      onPressed: () {
                                        openAppSettings();
                                      },
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Batal'),
                                    )
                                  ],
                                ));
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.format_paint),
                        onPressed: () async {
                          await wall8atur(
                            context: context,
                            imgUrl: widget.listWallpaper
                                .elementAt(_pageController.page.toInt())
                                .url,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]);
        },
      ),
    );
  }
}
