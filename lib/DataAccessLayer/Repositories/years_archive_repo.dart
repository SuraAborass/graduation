import 'dart:convert';

import '../Clients/years_archive_client.dart';
import '../Models/YearArchive.dart';
import '../Models/subject_file.dart';
import '../Models/subject_image.dart'; // نموذج SubjectImage

class YearsArchiveRepo {
  YearsArchiveClient client = YearsArchiveClient();

  Future<List<YearArchive>> getYears(String id, String token) async {
    var response = await client.getYears(id, token);
    if (response != "") {
      final List<dynamic> data = json.decode(response);
      return data.map<YearArchive>((json) => YearArchive.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<SubjectFile>> getFiles(String subjectId, String year, String token) async {
    var response = await client.getFiles(subjectId, year, token);
    if (response != "") {
      final List<dynamic> data = json.decode(response);
      return data.map<SubjectFile>((json) => SubjectFile.fromMap(json)).toList();
    }
    return [];
  }

  Future<List<SubjectImage>> getImages(String subjectId, String year, String token) async {
    var response = await client.getImages(subjectId, year, token);
    if (response != "") {
      final List<dynamic> data = json.decode(response);
      return data.map<SubjectImage>((json) => SubjectImage.fromMap(json)).toList();
    }
    return [];
  }
}
