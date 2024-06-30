import 'dart:convert';
import '../Clients/subject_client.dart';
import '../Models/homework.dart';
import '../Models/subject.dart';
import '../Models/subject_image.dart';

class SubjectsRepo {
  SubjectsClient client = SubjectsClient();

  Future<List<Subject>> getSubjects(String token) async {
    var response = await client.getSubjects(token);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Subject>((json) => Subject.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<SubjectImage>> getSubjectImages(String id, String token) async {
    var response = await client.getSubjectImages(id, token);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<SubjectImage>((json) => SubjectImage.fromMap(json)).toList();
    }
    return [];
  }


  Future<List<Homework>> getHomeworks(String id, String token) async {
    var response = await client.getHomeworks(id, token);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Homework>((json) => Homework.fromMap(json)).toList();
    }
    return [];
  }

}
