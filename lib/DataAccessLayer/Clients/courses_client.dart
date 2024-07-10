import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class CoursesClient {
  Future<dynamic> getCourses(String token) async {
    var response = await http.get(
      Uri.parse(baseLink + courses ),
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

