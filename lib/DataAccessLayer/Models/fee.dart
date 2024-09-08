class Fee{
  final int id;
  final String className;
  final int amount;
  final String year;

  Fee({
    required this.id,
    required this.className,
    required this.amount,
    required this.year
  });

factory Fee.fromMap(Map<String, dynamic> map) {
  return Fee(
      id: map['id'] as int,
      className: map['classs']['name'],
      amount: map['amount'] ?? 0,
    year: map['year'] ?? '',

  );
}

}