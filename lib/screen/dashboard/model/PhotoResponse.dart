import 'photo.dart';

class PhotoResponse {
  final bool success;
  final int totalPhotos;
  final String message;
  final int offset;
  final int limit;
  final List<Photo> photos;

  PhotoResponse({
    required this.success,
    required this.totalPhotos,
    required this.message,
    required this.offset,
    required this.limit,
    required this.photos,
  });

  factory PhotoResponse.fromJson(Map<String, dynamic> json) {
    List<Photo> photoList = (json['photos'] as List)
        .map((item) => Photo.fromJson(item))
        .toList();

    return PhotoResponse(
      success: json['success'],
      totalPhotos: json['total_photos'],
      message: json['message'],
      offset: json['offset'],
      limit: json['limit'],
      photos: photoList,
    );
  }
}
