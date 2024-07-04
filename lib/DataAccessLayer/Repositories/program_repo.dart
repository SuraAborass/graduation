import 'dart:convert';

import '../Clients/program_client.dart';
import '../Models/program.dart';

class ProgramRepo {
  ProgramClient client = ProgramClient();

  Future<List<Program>> getPrograms(String token) async {
    var response = await client.getPrograms(token);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Program>((json) => Program.fromMap(json)).toList();
    }
    return [];
  }
}
