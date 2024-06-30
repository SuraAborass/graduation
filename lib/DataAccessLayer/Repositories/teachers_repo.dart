import 'dart:convert';

import '../Clients/teachers_client.dart';
import '../Models/teacher.dart';

class TeachersRepo {
  TeachersClient client = TeachersClient();
  Future<List<Teacher>> getTeachers() async {
    var response = await client.getTeachers();
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Teacher>((json) => Teacher.fromMap(json))
          .toList();
    }
    return [];
  }
}