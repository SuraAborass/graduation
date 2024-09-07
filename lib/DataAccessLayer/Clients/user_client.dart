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
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(baseLink + "student/edit_some_info_profile")
    );

    request.headers['Authorization'] = 'Bearer $token';

    request.fields['phone'] = phone;
    request.fields['password'] = password;
    request.fields['conf_password'] = confPassword;
    request.fields['address'] = address;

    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('image', image));
    }

    var response = await request.send();

    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      print('Response body: $responseBody');
      return responseBody;
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
