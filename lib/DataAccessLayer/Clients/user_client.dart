import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class UserClient {
  Future<dynamic> login(email, password) async {
    var response = await http.post(Uri.parse(baseLink + loginLink),
        body:
        jsonEncode(<String, dynamic>{"email": email, "password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> updateInfo(String token, String phone, String password, String confPassword, String address, String? image) async {
    var response = await http.post(
      Uri.parse(baseLink + "student/edit_some_info_profile"),
      body: jsonEncode(<String, dynamic>{
        "phone": phone,
        "password": password,
        "conf_password": confPassword,
        "address": address,
        "image": image, // Optional
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  // Future<dynamic> updateAvatar(id, image) async {
  //   var url = Uri.parse("${baseLink}updateAvatar");
  //   print(url.toString());
  //   var request = http.MultipartRequest("POST", url)
  //     ..fields.addAll(<String, String>{
  //       "id": id.toString(),
  //       "image": image,
  //     })
  //     ..headers.addAll(<String, String>{
  //       'Content-Type': 'multipart/form-data',
  //     })
  //     ..files.add(await http.MultipartFile.fromPath('image', image));
  //   var response = await request.send();
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     return await response.stream.bytesToString();
  //   } else {
  //     return null;
  //   }
  // }
}
