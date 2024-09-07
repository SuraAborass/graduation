import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/links.dart';
import '../Clients/adverts_client.dart';
import '../Models/advert.dart';

class AdvertsRepo {
  AdvertsClient client = AdvertsClient();

  Future<List<Advert>> getAdverts(String token) async {
    var response = await client.getAdverts(token);
    if (response != "") {
      final jsonResponse = json.decode(response);
      if (jsonResponse['status'] == "true") {
        final data = jsonResponse['ads'].cast<Map<String, dynamic>>();
        return data.map<Advert>((json) => Advert.fromMap(json)).toList();
      } else {
        print('Error: Invalid response status');
      }
    } else {
      print('Error: Empty response');
    }
    return [];
  }

  Future<bool> registerCourse(int courseId, String token) async {
    final response = await client.registerForCourse(courseId, token);
    if (response != null && response['data'] == 'success') {
      return true;
    } else if (response != null && response['message'] == 'you can not do that you have order for this course') {
      return false;
    } else {
      throw Exception('Failed to register for course');
    }
  }
}
