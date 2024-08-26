import 'dart:convert';
import '../Clients/registration_order_client.dart';
import '../Models/student.dart';
class RegistrationOrderRepo{

  var client = RegistrationOrderClient();

  Future<Student?> registrationOrder(firstname, lastname,fatherName,birthDate,gender,
      phone,address,grade,year) async {
    var data = await client.registrationOrder(firstname, lastname,fatherName,birthDate,gender,
        phone,address,grade,year);
    print(data);
    if (data != null) {
      return Student.fromMap(jsonDecode(data));
    }
    return null;
  }
}