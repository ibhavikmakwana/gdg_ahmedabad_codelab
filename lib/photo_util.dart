class PhotoUtil {
  String id;
  String created_at;
  String updated_at;
  String width;
  String height;
  String color;
  String description;
  String urls;
  String categories;
  String slug;
  String user;

  PhotoUtil({
    this.id,
    this.created_at,
    this.updated_at,
    this.width,
    this.height,
    this.color,
    this.description,
    this.urls,
    this.categories,
    this.slug,
    this.user,
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
      urls: json['urls'],
      categories: json['categories'],
      slug: json['slug'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': created_at,
        'updated_at': updated_at,
        'width': width,
        'height': height,
        'color': color,
        'description': description,
        'urls': urls,
        'categories': categories,
        'slug': slug,
        'user': user,
      };
}
