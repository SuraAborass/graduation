import 'dart:convert';
import 'package:http/http.dart' as http;


class Advert {
  final int id;
  final String description;
  final int? courseId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String image;

  Advert({
    required this.id,
    required this.description,
    this.courseId,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory Advert.fromJson(Map<String, dynamic> json) {
    return Advert(
      id: json['ad_info']['id'] ?? 0,
      description: json['ad_info']['description'] ?? "",
      courseId: json['ad_info']['course_id'] ?? 0,
      createdAt: DateTime.parse(json['ad_info']['created_at']),
      updatedAt: DateTime.parse(json['ad_info']['updated_at']),
      image: json['images'].length > 0 ?  json['images'][0]['file_info']['image_url']:"",
    );
  }
}

class AdvertService {
  static const String url = "http://192.168.43.99:8000/api/all_publish" ;



  /// عررض جميع اعلانات بالمعهد
  static Future<List<Advert>> fetchAdverts(String token) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        if (body['status'] == "true") {
          List<Advert> adverts = [];
          //print(body['ads']);
          for(var ad in body['ads'] as List){
            adverts.add(Advert.fromJson(ad));
          }
          return adverts;
        } else {
          throw Exception('Unexpected response format or null ads list');
        }
      } else {
        print('Failed to load adverts. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load adverts');
      }
    } catch (e) {
      print('Error fetching adverts: $e');
      throw e;
    }
  }

  }









