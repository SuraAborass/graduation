import 'dart:convert';

import '../Clients/notifications_client.dart';
import '../Models/notification.dart';

class UserNotificationsRepo {
  UserNotificationsClient client = UserNotificationsClient();

  Future<List<UserNotification>> getUserNotifications(String token) async {
    var response = await client.getUserNotifications(token);
    if (response != "") {
      final List<dynamic> jsonResponse = json.decode(response);
      return jsonResponse.map<UserNotification>((json) => UserNotification.fromMap(json)).toList();
    } else {
      print('Error: Empty response');
    }
    return [];
  }
}
