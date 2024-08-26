import 'dart:convert';


class Student {
  final int id;
  final String firstName;
  final String lastName;
  final String fatherName;
  final String birthDate;
  final String gender;
  final String phone;
  final String address;
  final String grade;
  final String year;
  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fatherName,
    required this.birthDate,
    required this.gender,
    required this.phone,
    required this.address,
    required this.grade,
    required this.year,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name' : firstName,
      'last_name': lastName,
      'father_name': fatherName,
      'birthday': birthDate,
      'gender' : gender,
      'phone' : phone,
      'address': address,
      'class' : grade,
      'year' : year,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id']?.toInt() ?? 0,
      firstName: map['first_name']?? '',
      lastName: map['last_name']?? '',
      fatherName: map['father_name'] ?? '',
      birthDate: map['birthday'].toString() ?? '',
        gender: map['gender'] ?? '',
        phone: map['phone'] ?? '',
        address: map['address'] ?? '' ,
      grade:  map['class'] ?? '',
        year: map['year'] ?? ''
    );
  }

  String toJson() => json.encode(toMap());
  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);
}
