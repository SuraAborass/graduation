import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class YearsArchiveClient {
  Future<dynamic> getYears(String id, String token) async {
    var response = await http.get(
      Uri.parse(baseLink + "student/display_year_archive/${id}"),
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

  Future<dynamic> getFiles(String subjectId, String year, String token) async {
    var response = await http.get(
      Uri.parse(baseLink + "student/file_subject_year/${subjectId}/${year}"),
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

  Future<dynamic> getImages(String subjectId, String year, String token) async {
    var response = await http.get(
      Uri.parse(baseLink + "student/img_subject_year/${subjectId}/${year}"),
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
