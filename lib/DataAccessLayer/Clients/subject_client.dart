import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class SubjectsClient {
  Future<dynamic> getSubjects(String token) async {
    var response = await http.get(
      Uri.parse(baseLink + subjects),
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

  Future<dynamic> getSubjectImages(String id, String token) async {
    var response = await http.get(
      Uri.parse(baseLink + "student/img_subject/${id}"),
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

  Future<dynamic> getHomeworks(String id, String token) async {
    var response = await http.get(
      Uri.parse(baseLink + "student/my_homework/${id}"),
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

  Future<dynamic> getSubjectFiles(String id, String token) async {
    var response = await http.get(
      Uri.parse(baseLink + "student/file_subject/${id}"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
