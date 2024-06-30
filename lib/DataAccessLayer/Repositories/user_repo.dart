import 'dart:convert';
import '../Clients/user_client.dart';
import '../Models/user.dart';
import 'package:get_storage/get_storage.dart';

class UserRepo {
  var client = UserClient();

  Future<User?> login(String email, String password) async {
    var data = await client.login(email, password);
    print(data);
    if (data != null) {
      var jsonData = jsonDecode(data);
      var user = User.fromMap(jsonData);
      final storage = GetStorage();
      storage.write('userToken', user.token); // تخزين التوكن
      return user;
    }
    return null;
  }
}
