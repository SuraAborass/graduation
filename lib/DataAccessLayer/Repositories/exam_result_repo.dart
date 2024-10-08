

import 'dart:convert';

import '../Clients/exam_result_client.dart';
import '../Models/exam_result.dart';

class StudentMarkRepository {
   StudentMarkClient client = StudentMarkClient();


   Future<List<StudentMark>> getStudentMarks(String token) async {
     var response = await client.fetchStudentMarks(token);
     if (response != "") {
       final data = json.decode(response).cast<Map<String, dynamic>>();
       return data.map<StudentMark>((json) => StudentMark.fromMap(json)).toList();
     }
     return [];
   }
}
