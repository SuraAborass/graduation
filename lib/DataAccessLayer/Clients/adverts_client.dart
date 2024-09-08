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

////out user methods
  Future<dynamic> getOutUserAdverts() async {
    var response = await http.get(Uri.parse(baseLink + outAdverts));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> AddOrderToCourse(firstname, lastname,fatherName,gender,
      phone,address,int courseId) async {
    var response = await http.post(Uri.parse(baseLink + "out_user/CreateOrderForCourse_out_user/${courseId}"),
        body:
        jsonEncode(<String, dynamic>{"first_name": firstname,
          "last_name": lastname,
          "father_name": fatherName,
          "gender": gender,
          "phone": phone,
          "address" : address,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
