import 'dart:convert';


class User {
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
  final String userType;
   String? token;
  User({
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
    required this.userType,
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
      'user_type': userType,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['user']['id']?.toInt() ?? 0,
      firstName: map['user']['first_name']?? '',
      lastName: map['user']['last_name']?? '',
      fatherName: map['user']['father_name']??'',
      motherName: map['user']['mother_name'] ?? '',
      birthday: map['user']['birthday'] ?? '',
      gender: map['user']['gender'] ?? '',
      phone: map['user']['phone'] ?? '',
      address: map['user']['address'] ?? '',
      year: map['user']['year'] ?? '',
      image: map['user']['image'] ?? '',
      email: map['user']['email'] ?? '',
      userType: map['user']['user_type'] ?? '',
      token: map['token'] ?? '',

    );
  }
  factory User.fromBoxMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      firstName: map['first_name'],
      lastName: map['last_name'],
      fatherName: map['father_name'],
      motherName: map['mother_name'] ?? '',
      birthday: map['birthday'] ?? '',
      gender: map['gender'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      year: map['year'] ?? '',
      image: map['image'] ?? '',
      email: map['email'] ?? '',
      userType: map['user_type'] ?? '',
      token: map['token'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
