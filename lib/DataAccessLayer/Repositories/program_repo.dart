import 'dart:convert';
import '../Clients/program_client.dart';
import '../Clients/subject_client.dart';
import '../Models/homework.dart';
import '../Models/pragram.dart';
import '../Models/subject.dart';
import '../Models/subject_image.dart';

class ProgramRepo {
  ProgramClient client = ProgramClient();


  Future<List<Program>> getProgram(String token) async {
    var response = await client.getProgram( token);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Program>((json) => Program.fromMap(json)).toList();
    }
    return [];
  }



}
