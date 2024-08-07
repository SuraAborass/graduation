import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class DiscussionsClient {
  Future<dynamic> getDiscussions(String token) async {
    var response = await http.get(
      Uri.parse(baseLink + discussions),
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
