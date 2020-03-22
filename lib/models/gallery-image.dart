class GalleryImage{
  final String url;
  final String small;
  final String medium;
  final String big;

  GalleryImage({this.url, this.small, this.medium, this.big});

  factory GalleryImage.fromJson(Map<String, dynamic> json){
    return GalleryImage(
      url: json["url"],
      small: json["small"],
      medium: json["medium"],
      big: json["big"],
    );
  }
}