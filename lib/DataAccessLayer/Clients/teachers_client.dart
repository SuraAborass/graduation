import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class TeachersClient {
  Future<dynamic> getTeachers() async {
    var response = await http.get(Uri.parse(baseLink + teachers));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
