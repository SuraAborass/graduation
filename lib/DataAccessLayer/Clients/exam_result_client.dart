import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Constants/links.dart';
import '../Models/exam_result.dart';


class StudentMarkClient {
  Future<dynamic> fetchStudentMarks(String token) async {
    var response = await http.get(
      Uri.parse(baseLink+"student/my_mark"),
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
