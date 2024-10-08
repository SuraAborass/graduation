import 'dart:convert';
import '../Clients/user_client.dart';
import '../Models/user.dart';
import 'package:get_storage/get_storage.dart';

class UserRepo {
  var client = UserClient();

  Future<User?> login(String email, String password) async {
    var data = await client.login(email, password);
    print('Login Response: $data');

    if (data != null) {
      var jsonData = jsonDecode(data);
      var user = User.fromMap(jsonData);

      // تخزين التوكن في التخزين المؤقت
      final storage = GetStorage();
      storage.write('userToken', user.token);

      return user;
    }

    return null;
  }

  Future<User?> updateInfo(String token, String phone, String password, String confPassword, String address, String? image) async {
    print("Token: $token");
    print("Phone: $phone");
    print("Password: $password");
    print("Confirm Password: $confPassword");
    print("Address: $address");
    print("Image Path: $image");

    var response = await client.updateInfo(token, phone, password, confPassword, address, image);

    if (response != null) {
      return User.fromMap(jsonDecode(response));
    }
    return null;
  }

}
