
class SubjectImage {
  final int id;
  final String url;
  final String description;

  SubjectImage({
    required this.id,
    required this.url,
    required this.description,
  });

  factory SubjectImage.fromMap(Map<String, dynamic> map) {
    return SubjectImage(
      id: map['image_info']['id'] as int,
      description: map['image_info']['description'] as String,
      url: map['image_info']['image_url'],
    );
  }
}