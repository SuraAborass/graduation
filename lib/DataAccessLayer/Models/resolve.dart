class Resolve{
  final String resolveBrother;
  final String resolveMartyr;
  final String resolveSonTeacher;


  Resolve({
    required this.resolveBrother,
    required this.resolveMartyr,
    required this.resolveSonTeacher,

  });

  factory Resolve.fromMap(Map<String, dynamic> map) {
    return Resolve(
      resolveBrother: map['resolve_brother']??'',
      resolveMartyr: map['resolve_martyr']??'',
      resolveSonTeacher: map['resolve_Son_teacher']??'',
    );
  }

}