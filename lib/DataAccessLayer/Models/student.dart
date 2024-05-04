import 'dart:convert';


class Student {
  final int id;
  final String image;
  final String firstName;
  final String secondName;
  final String classroom;
  final String grade;
  final int gradeId;
  final String motherName;
  final String fatherName;
  final String birthDate;
  final String nationality;
  final String payType;
  final String gender;
  Student({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.image,
    required this.classroom,
    required this.grade,
    required this.motherName,
    required this.fatherName,
    required this.birthDate,
    required this.nationality,
    required this.payType,
    required this.gender,
    required this.gradeId
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name' : firstName,
      'second_name': secondName,
      'image': image,
      'classroom': classroom,
      'grade' : grade,
      'grade_id' : gradeId,
      'mother_name': motherName,
      'father_name' : fatherName,
      'birth_date': birthDate,
      'nationality' : nationality,
      'pay_type' : payType,
      'gender' : gender
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id']?.toInt() ?? 0,
      firstName: map['first_name'],
      secondName: map['second_name'],
      image: map['image'] ?? '',
      classroom: map['classroom'] ?? '',
      grade: map['grade'] ?? '',
      gradeId: map['grade_id'] ?? 0,
      motherName: map['mother_name'] ?? '',
      fatherName: map['father_name'] ?? '',
      birthDate: map['birth_date'].toString() ?? '',
        nationality: map['nationality'],
      payType: map['pay_type'] ?? '' ,
      gender:  map['gender'] ?? ''
    );
  }

  String toJson() => json.encode(toMap());
  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);
}
