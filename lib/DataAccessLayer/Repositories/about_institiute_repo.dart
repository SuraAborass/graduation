import 'dart:convert';
import '../Clients/about_institute_client.dart';
import '../Models/fee.dart';
import '../Models/institute.dart';


class InfoRepo {
  InfoClient client = InfoClient();
  Future<List<Institute>> getInfo() async {
    var response = await client.getInfo();
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Institute>((json) => Institute.fromMap(json))
          .toList();
    }
    return [];
  }

  Future<List<Fee>> getFees() async {
    var response = await client.getFees();
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Fee>((json) => Fee.fromMap(json))
          .toList();
    }
    return [];
  }
}