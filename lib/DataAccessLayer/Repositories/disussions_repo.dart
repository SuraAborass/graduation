import 'dart:convert';
import '../Clients/discussions_client.dart';
import '../Models/discussion.dart';



class DiscussionsRepo {
  DiscussionsClient client = DiscussionsClient();

  Future<List<Discussion>> getDiscussions(String token) async {
    var response = await client.getDiscussions( token);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Discussion>((json) => Discussion.fromMap(json)).toList();
    }
    return [];
  }

}
