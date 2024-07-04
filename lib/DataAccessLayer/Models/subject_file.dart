class SubjectFile {
  final int id;
  final String name;
  final String description;
  final String fileUrl;

  SubjectFile({
    required this.id,
    required this.name,
    required this.description,
    required this.fileUrl,
  });

  factory SubjectFile.fromMap(Map<String, dynamic> map) {
    return SubjectFile(
      id: map['file_info']['id'],
      name: map['file_info']['name'],
      description: map['file_info']['description'],
      fileUrl: map['file_info']['file_url'],
    );
  }
}
