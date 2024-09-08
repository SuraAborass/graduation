import 'dart:convert';

import '../Clients/courses_client.dart';
import '../Models/course.dart';
import '../Models/file_for_course.dart';


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

  Future<List<FileCourse>> getFilesForCourse(int courseId, String token) async {
    var response = await client.getFilesForCourse(courseId, token);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<FileCourse>((json) => FileCourse.fromMap(json)).toList();
    }
    return [];
  }

}
