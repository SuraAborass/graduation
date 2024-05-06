import 'package:get/get.dart';

import '../../DataAccessLayer/Models/grade.dart';
class RegistrationOrderController extends GetxController{
  int? selectedGradeId ;
  String? gradeText;
  Grade? grade;


  void setGradId(id,text) async{
    selectedGradeId = id;
    gradeText = text;
   // print(id);
    update();
  }
}