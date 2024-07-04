import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class NotesClient {
  Future<dynamic> getNotes(String token) async {
    var response = await http.get(
      Uri.parse(baseLink + "student/my_note"),
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
