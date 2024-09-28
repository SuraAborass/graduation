

class UserNotification{
  final String title;
  final String body;
  final String createdAt;


  UserNotification({
    required this.title,
    required this.body,
    required this.createdAt,
  });

  factory UserNotification.fromMap(Map<String, dynamic> map) {
    return UserNotification(
      title: map['title'] as String,
      body: map['body'] as String,
      createdAt: map['createdAt'] ?? '',
    );
  }
}