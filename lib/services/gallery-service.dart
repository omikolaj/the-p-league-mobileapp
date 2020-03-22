import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:the_p_league_mobileapp/models/gallery-image.dart';

class GalleryService{
  Future<List<GalleryImage>> fetchGalleryImages() async {
    final response = await http.get('https://www.thepleague.club/api/gallery');

    if(response.statusCode == 200){     
      Iterable galleryImages = json.decode(response.body);
      List<GalleryImage> images = galleryImages.map((var model) => GalleryImage.fromJson(model)).toList();
      return images;
    }
    else{
      throw Exception('Failed to load gallery images');
    }
  }
}