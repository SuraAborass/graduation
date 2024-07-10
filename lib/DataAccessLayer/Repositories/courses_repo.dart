import 'dart:convert';

import '../Clients/courses_client.dart';
import '../Models/course.dart';


class CoursesRepo {
  CoursesClient client = CoursesClient();

  Future<List<Course>> getCourses(String token) async {
    var response = await client.getCourses(token);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Course>((json) => Course.fromMap(json)).toList();
    }
    return [];
  }
}
