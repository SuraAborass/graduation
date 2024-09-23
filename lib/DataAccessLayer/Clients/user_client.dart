import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UserClient {
  Future<dynamic> login(String email, String password) async {
    // الحصول على FCM token
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? fcmToken = await messaging.getToken(
      vapidKey: "BDzG_Nu1aYj-GH9vfWHx4S6j29xC1rpgeuPWFTQUPvUn0Fam3_r9FmJ9krXp00vk1InM9BIwpjxu4bHyBDUfT_0"
    ); // احصل على FCM Token
    print('FCM Token: $fcmToken');

    // إرسال طلب تسجيل الدخول مع توكن FCM إلى الخادم
    var response = await http.post(
        Uri.parse(baseLink + loginLink),
        body: jsonEncode(<String, dynamic>{
          "email": email,
          "password": password,
          "fcm_token": fcmToken // إرسال التوكن مع بيانات تسجيل الدخول
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );

    print('Response: ${response.body}');
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
