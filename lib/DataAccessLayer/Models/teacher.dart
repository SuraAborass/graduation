import 'dart:convert';


class Teacher {
  final int id;
  final String firstName;
  final String lastName;
  final String fatherName;
  final String motherName;
  final String birthday;
  final int gender;
  final String phone;
  final String address;
  final String year;
  final String image;
  final String email;
  final String subjectName;
  String? token;
  Teacher({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fatherName,
    required this.motherName,
    required this.birthday,
    required this.gender,
    required this.phone,
    required this.address,
    required this.year,
    required this.image,
    required this.email,
    required this.subjectName,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name' : firstName,
      'last_name' : lastName,
      'father_name': fatherName,
      'mother_name':motherName,
      'birthday':birthday,
      'gender':gender,
      'phone': phone,
      'address' : address,
      'year': year,
      'image' : image,
      'email':email,
      'name': subjectName,
      'token': token,
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      id: map['id']?.toInt() ?? 0,
      firstName: map['first_name']?? '',
      lastName: map['last_name']?? '',
      fatherName: map['father_name']??'',
      motherName: map['mother_name'] ?? '',
      birthday: map['birthday'] ?? '',
      gender: map['gender'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      year: map['year'] ?? '',
      image: map['image'] ?? '',
      email: map['email'] ?? '',
      subjectName: map['teacher']['subject'][0]['name'] ?? '',
      token: map['token'] ?? '',

    );
  }
  String toJson() => json.encode(toMap());
  factory Teacher.fromJson(String source) =>
      Teacher.fromMap(json.decode(source) as Map<String, dynamic>);
}
