import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../DataAccessLayer/Models/exam_result.dart';
import '../../DataAccessLayer/Repositories/exam_result_repo.dart';


class StudentMarkController extends GetxController {
   StudentMarkRepository repo = StudentMarkRepository();
   List<StudentMark> studentMarks = [];
  var isLoading = true.obs;
  var error = ''.obs;
   final storage = GetStorage();

   @override
   void onInit() {
     super.onInit();
     fetchMarks();
   }
   Future<void> fetchMarks() async {
     isLoading.value = true;
     String? token = storage.read('userToken');
     if (token != null) {
       studentMarks = await repo.getStudentMarks(token);
       print("studentMarks: $studentMarks");
     } else {
       print("No token found!");
     }
     update();
     isLoading.value = false;
   }

}
