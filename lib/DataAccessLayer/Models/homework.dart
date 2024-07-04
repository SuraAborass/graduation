class Homework {
  final int id;
  final String description;
  final String path;
  final bool hasAttachment;
  final String subjectName;

  Homework({
    required this.id,
    required this.description,
    required this.path,
    required this.hasAttachment,
    required this.subjectName,
  });

  factory Homework.fromMap(Map<String, dynamic> map) {
    var filePath = map['file_image_info'] != null && map['file_image_info'].isNotEmpty
        ? map['file_image_info'][0]['image_url'] as String
        : "";
    return Homework(
      id: map['id'] as int,
      description: map['description'],
      path: filePath,
      hasAttachment: filePath.isNotEmpty,
      subjectName: map['subject_name'] ?? "No Subject Name",
    );
  }
}