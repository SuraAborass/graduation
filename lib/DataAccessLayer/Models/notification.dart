

class UserNotification{
  final int id;
  final String title;
  final String description;
  final dynamic data;
  final String type;
  final String time;


  UserNotification({
    required this.id,
    required this.title,
    required this.description,
    required this.data,
    required this.type,
    required this.time,
  });

  factory UserNotification.fromMap(Map<String, dynamic> map) {
    return UserNotification(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      data: map['data'],
      type: map['type'],
      time: map['time'],

    );
  }
}