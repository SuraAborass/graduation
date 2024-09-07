class Institute{
  final int id;
  final String name;
  final String address;
  final String phone;
  final String description;
  final String facebookLink;


  Institute({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.description,
    required this.facebookLink,

  });

factory Institute.fromMap(Map<String, dynamic> map) {
  return Institute(
      id: map['id'] as int,
      name: map['name']?? '',
      address: map['address']?? '',
      phone: map['phone']?? '',
      description: map['description']??'',
      facebookLink: map['facebook_link']??'',
  );
}

}