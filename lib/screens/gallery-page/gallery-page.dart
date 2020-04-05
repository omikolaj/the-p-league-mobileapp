import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:the_p_league_mobileapp/models/gallery-image.dart';
import 'package:the_p_league_mobileapp/services/gallery-service.dart';
import 'package:photo_view/photo_view.dart';
import 'gallery-photo-view-wrapper.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({Key key}) : super(key: key);

  final Decoration backgroundDecoration = BoxDecoration(
            color: Colors.black
          );

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  Future<List<GalleryImage>> futureGalleryImages;
  bool verticalGallery = false;
  Widget imageListView;

  @override
  void initState() {
    super.initState();
    _populateGalleryImages();
  }

  @override
  Widget build(BuildContext context) {    
    return FutureBuilder(
      future: this.futureGalleryImages,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();            
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else              
              return _createListView(context, snapshot);              
        }
      },
    );
  }

  Future _populateGalleryImages() {
    return this.futureGalleryImages = GalleryService().fetchGalleryImages();
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<GalleryImage> images = snapshot.data;
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: GestureDetector(
                onTap: () {
                  open(context, images, index);
                }, // handle your image tap here
                child: SizedBox(
                    width: 200.0,
                    height: 300.0,
                    child: Hero(
                      tag: images[index].id,
                      child: PhotoView(
                        imageProvider: NetworkImage(images[index].url),
                  )
                )
              )
            ),
          );
        });
  }

  void open(BuildContext context, List<GalleryImage> images, final int index){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryPhotoViewWrapper(
          galleryItems: images,
          backgroundDecoration: widget.backgroundDecoration,
          initialIndex: index,
          scrollDirection: verticalGallery ? Axis.vertical : Axis.horizontal
        )
      )
    );
  }

//   Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
//     List<GalleryImage> galleryItems = snapshot.data;
//     return PhotoViewGallery.builder(
//   scrollPhysics: const BouncingScrollPhysics(),
//   builder: (BuildContext context, int index) {
//     return PhotoViewGalleryPageOptions(
//       imageProvider: NetworkImage(galleryItems[index].url),
//       initialScale: PhotoViewComputedScale.contained * 1.0,
//       minScale: PhotoViewComputedScale.contained * 0.8,
//       maxScale: PhotoViewComputedScale.covered * 1.1,
//       heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id, transitionOnUserGestures: true),
//     );
//   },
//   itemCount: galleryItems.length,
//   loadingBuilder: (context, progress) => Center(
//            child: Container(
//              width: 20.0,
//              height: 20.0,
//              child: CircularProgressIndicator(
//                value: progress == null
//                    ? null
//                    : progress.cumulativeBytesLoaded /
//                        progress.expectedTotalBytes,
//              ),
//            ),
//          ),
//          backgroundDecoration: widget.backgroundDecoration         
// );
//   }
}



// Image.network(
//                     images[index].url,
//                     fit: BoxFit.cover, // this is the solution for border
//                     width: 110.0,
//                     height: 250.0,
//                   )
