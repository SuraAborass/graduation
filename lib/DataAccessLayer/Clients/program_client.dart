import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class ProgramClient {
  Future<dynamic> getPrograms(String token) async {
    var response = await http.get(
      Uri.parse(baseLink + "student/my_programe"), // تأكد من أن الرمز المميز معروف في الخادم
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

