import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:the_p_league_mobileapp/models/gallery-image.dart';

class GalleryService{
  static List<GalleryImage> galleryImagesCache = List<GalleryImage>();
  Future<List<GalleryImage>> fetchGalleryImages() async {
    if(GalleryService.galleryImagesCache.length > 0)
      return GalleryService.galleryImagesCache;
    final response = await http.get('https://www.thepleague.club/api/gallery');

    if(response.statusCode == 200){     
      Iterable galleryImages = json.decode(response.body);      
      GalleryService.galleryImagesCache = galleryImages.map((var model) => GalleryImage.fromJson(model)).toList();
      return GalleryService.galleryImagesCache;
    }
    else{
      throw Exception('Failed to load gallery images');
    }
  }
}