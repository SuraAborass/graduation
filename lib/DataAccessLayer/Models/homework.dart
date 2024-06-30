
class Homework {
  final int id;
  final String subjectName;
  final String description;

  Homework({
    required this.id,
    required this.subjectName,
    required this.description,
  });

  factory Homework.fromMap(Map<String, dynamic> map) {
    return Homework(
      id: map['id'] as int,
      subjectName: map['subject']['name'] as String,
      description: map['description'],
    );
  }
}