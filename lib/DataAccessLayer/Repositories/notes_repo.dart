import 'dart:convert';
import '../Clients/notes_client.dart';
import '../Models/note.dart';



class NotesRepo {
  NotesClient client = NotesClient();


  Future<List<Note>> getNotes(String token) async {
    var response = await client.getNotes( token);
    if (response != "") {
      final data = json.decode(response).cast<Map<String, dynamic>>();
      return data.map<Note>((json) => Note.fromMap(json)).toList();
    }
    return [];
  }



}
