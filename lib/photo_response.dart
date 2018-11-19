class PhotoResponse {
  String id;
  String createdAt;
  String updatedAt;
  int width;
  int height;
  String color;
  String description;
  PhotoUrls urls;
  User user;

  PhotoResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    this.color,
    this.description,
    this.urls,
    this.user,
  });

  static PhotoResponse fromJson(Map<String, dynamic> json) {
    return PhotoResponse(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      description: json['description'],
      user: User.fromJson(json['user']),
      urls: PhotoUrls.fromJson(json['urls']),
    );
  }
}

class User {
  String username;
  String name;
  String bio;

  User({this.username, this.name, this.bio});

  static User fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      name: json['name'],
      bio: json['bio'],
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
