import 'dart:convert';
import '../Clients/subject_client.dart';
import '../Models/homework.dart';
import '../Models/subject.dart';
import '../Models/subject_file.dart';
import '../Models/subject_image.dart';

class SubjectsRepo {
  SubjectsClient client = SubjectsClient();

  Future<List<Subject>> getSubjects(String token) async {
    var response = await client.getSubjects(token);
    if (response != "") {
      final List<dynamic> data = json.decode(response);
      return data.map<Subject>((json) => Subject.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<SubjectImage>> getSubjectImages(String id, String token) async {
    var response = await client.getSubjectImages(id, token);
    if (response != "") {
      final List<dynamic> data = json.decode(response);
      return data.map<SubjectImage>((json) => SubjectImage.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<Homework>> getHomeworks(String id, String token) async {
    var response = await client.getHomeworks(id, token);
    if (response != "") {
      final jsonResponse = json.decode(response);
      if (jsonResponse['status'] == "true") {
        final List<dynamic> data = jsonResponse['homeworks'];
        return data.map<Homework>((json) => Homework.fromMap(json)).toList();
      } else {
        print('Error: Invalid response status');
      }
    } else {
      print('Error: Empty response');
    }
    return [];
  }

  Future<List<SubjectFile>> getSubjectFiles(String id, String token) async {
    var response = await client.getSubjectFiles(id, token);
    if (response != "") {
      final List<dynamic> data = json.decode(response);
      return data.map<SubjectFile>((json) => SubjectFile.fromMap(json)).toList();
    }
    return [];
  }
}
