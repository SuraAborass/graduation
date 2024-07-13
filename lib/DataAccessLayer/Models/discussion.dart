class Discussion {
  final int id;
  final String question;
  final String subjectName;
  final String teacherFirstName;
  final String teacherLastName;

  Discussion({
    required this.id,
    required this.question,
    required this.subjectName,
    required this.teacherFirstName,
    required this.teacherLastName
  });

  factory Discussion.fromMap(Map<String, dynamic> map) {
    return Discussion(
      id: map['id'] ?? 0,
      question: map['question'] ?? "",
      subjectName:map['subject']['name'],
      teacherFirstName:map['teacher']['user']['first_name'],
      teacherLastName: map['teacher']['user']['last_name']

    );
  }
}
