class GalleryImage{
  final String url;
  final String small;
  final String medium;
  final String big;
  final int id;

  GalleryImage({this.url, this.small, this.medium, this.big, this.id});

  factory GalleryImage.fromJson(Map<String, dynamic> json){
    return GalleryImage(
      id: json["id"],
      url: json["url"],
      small: json["small"],
      medium: json["medium"],
      big: json["big"],
    );
  }
}