import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class UserNotificationsClient {
  Future<dynamic> getUserNotifications(String token) async {
    var response = await http.get(
      Uri.parse(baseLink + userNotifications),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}