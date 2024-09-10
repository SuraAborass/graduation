import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class InfoClient {
  Future<dynamic> getInfo() async {
    var response = await http.get(Uri.parse(baseLink + info));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> getFees() async {
    var response = await http.get(Uri.parse(baseLink + fees ));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  Future<dynamic> getResolves() async {
    var response = await http.get(Uri.parse(baseLink + resolves ));
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
