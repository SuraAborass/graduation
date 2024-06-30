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

  // Future<dynamic> updateInfo(id, password, address, phone) async {
  //   var response = await http.post(Uri.parse(baseLink + updateProfile),
  //       body: jsonEncode(<String, dynamic>{
  //         "id": id.toString(),
  //         "password": password,
  //         "address": address,
  //         "phone": phone,
  //       }),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       });
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     return null;
  //   }
  // }

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
