class Photo {
  final int id;
  final String title;
  final String url;
  final String description;
  final int user;

  Photo({
    required this.id,
    required this.title,
    required this.url,
    required this.description,
    required this.user,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      description: json['description'],
      user: json['user'],
    );
  }
}
