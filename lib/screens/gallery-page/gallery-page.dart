import 'package:flutter/material.dart';
import 'package:the_p_league_mobileapp/models/gallery-image.dart';
import 'package:the_p_league_mobileapp/services/gallery-service.dart';
import 'package:async/async.dart';



class GalleryPage extends StatefulWidget {
  GalleryPage({Key key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> with AutomaticKeepAliveClientMixin {
  Future<List<GalleryImage>> futureGalleryImages;
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  ImageProvider _imageProvider;

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();    
    print('deactiveating');
  }
  
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _populateGalleryImages();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
    return this._memoizer.runOnce(() async {
      this.futureGalleryImages = GalleryService().fetchGalleryImages();
    });
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<GalleryImage> images = snapshot.data;        
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: GestureDetector(
              onTap: () {}, // handle your image tap here
              child: 
                Image.network(
                    images[index].url,
                    fit: BoxFit.cover, // this is the solution for border
                    width: 110.0,
                    height: 250.0,
                  )
            ),
          );
        });
  }
}


// Image.network(
//                     images[index].url,
//                     fit: BoxFit.cover, // this is the solution for border
//                     width: 110.0,
//                     height: 250.0,
//                   )
