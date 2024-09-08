class Institute{
  final int id;
  final String name;
  final String address;
  final String phone1;
  final String description;
  final String facebookLink;
  final String phone2;
  final String resolveBrother;
  final String resolveMartyr;
  final String resolveSonTeacher;


  Institute({
    required this.id,
    required this.name,
    required this.address,
    required this.phone1,
    required this.description,
    required this.facebookLink,
    required this.phone2,
    required this.resolveBrother,
    required this.resolveMartyr,
    required this.resolveSonTeacher,

  });

factory Institute.fromMap(Map<String, dynamic> map) {
  return Institute(
      id: map['id'] as int,
      name: map['name']?? '',
      address: map['address']?? '',
      phone1: map['phone1']?? '',
    phone2: map['phone2']?? '',
      description: map['description']??'',
      facebookLink: map['facebook_link']??'',
    resolveBrother: map['resolve_brother']??'',
    resolveMartyr: map['resolve_martyr']??'',
    resolveSonTeacher: map['resolve_Son_teacher']??'',
  );
}

}