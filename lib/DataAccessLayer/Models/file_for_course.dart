class FileCourse {
  final int id;
  final String description;
  final String url;
  final bool hasAttachment;

  FileCourse({
    required this.id,
    required this.description,
    required this.url,
    required this.hasAttachment,
  });

  factory FileCourse.fromMap(Map<String, dynamic> map) {
    return FileCourse(
      id: map['id'],
      description: map['description'],
      url: map['image_file_url'],
      hasAttachment: map['image_file_url'] != null && map['image_file_url'].isNotEmpty,
    );
  }
}
