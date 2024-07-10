class YearArchive {
  final int id;
  final String year;
  final int subjectId;

  YearArchive({
    required this.id,
    required this.year,
    required this.subjectId,
  });

  factory YearArchive.fromMap(Map<String, dynamic> map) {
    return YearArchive(
      id: map['id'],
      year: map['year'],
      subjectId: map['subject_id'],
    );
  }
}
