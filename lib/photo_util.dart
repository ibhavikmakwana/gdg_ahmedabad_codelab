class PhotoUtil {
  String id;
  String created_at;
  String updated_at;
  int width;
  int height;
  String color;
  String description;
  PhotoUrls urls;

  PhotoUtil({
    this.id,
    this.created_at,
    this.updated_at,
    this.width,
    this.height,
    this.color,
    this.description,
    this.urls,
  });

  static PhotoUtil fromJson(Map<String, dynamic> json) {
    return PhotoUtil(
      id: json['id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      description: json['description'],
      urls: PhotoUrls.fromJson(json['urls']),
    );
  }
}

class PhotoUrls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  PhotoUrls({this.raw, this.full, this.regular, this.small, this.thumb});
  static PhotoUrls fromJson(Map<String, dynamic> json) {
    return PhotoUrls(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb'],
    );
  }
}
