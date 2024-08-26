import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Constants/links.dart';

class RegistrationOrderClient {
  Future<dynamic> registrationOrder(firstname, lastname,fatherName,birthDate,gender,
      phone,address,grade,year) async {
    var response = await http.post(Uri.parse(baseLink + "out_user/add-order"),
        body:
        jsonEncode(<String, dynamic>{"first_name": firstname,
          "last_name": lastname,
          "father_name": fatherName,
          "birthday": birthDate,
          "gender": gender,
          "phone": phone,
          "address" : address,
          "class" : grade,
          "year" : year
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }}