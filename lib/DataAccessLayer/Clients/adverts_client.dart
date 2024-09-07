import 'package:http/http.dart' as http;
import '../../Constants/links.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class AdvertsClient {
  Future<dynamic> getAdverts(String token) async {
    var response = await http.get(
      Uri.parse(baseLink + ads),
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

  Future<dynamic> registerForCourse(int courseId, String token) async {
    var response = await http.post(
      Uri.parse(baseLink + 'student/create-order-course/$courseId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
