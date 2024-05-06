class Grade{
  final int id;
  final String name;
  final int fee;

  Grade({
    required this.id,
    required this.name,
    required this.fee
  });

  // factory Grade.fromMap(Map<String, dynamic> map) {
  //   return Grade(
  //       id: map['id'] as int,
  //       name: map['name'],
  //       fee: map['fee'] ?? 0
  //   );
  // }

}