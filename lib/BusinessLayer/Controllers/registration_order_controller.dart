import 'package:get/get.dart';

import '../../DataAccessLayer/Models/grade.dart';
class RegistrationOrderController extends GetxController{
  var selecteGradeValue = ''.obs;
  var selecteGenderValue = ''.obs;

  void setGradeValue(String value) {
    selecteGradeValue.value = value;
  }
  void setGenderValue(String value) {
    selecteGenderValue.value = value;
  }


  // int? selectedGradeId ;
  // String? gradeText;
  // Grade? grade;
  //
  //
  // void setGradId(id,text) async{
  //   selectedGradeId = id;
  //   gradeText = text;
  //  // print(id);
  //   update();
  // }
}