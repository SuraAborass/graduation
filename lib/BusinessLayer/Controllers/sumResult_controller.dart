import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../DataAccessLayer/Models/sumMark.dart';
import '../../DataAccessLayer/Repositories/sumMark_repo.dart';

class SumResultController extends GetxController{
  SumMarkRepository repo = SumMarkRepository();
  List<StudentResult> studentResults = [];
  var isLoading = true.obs;
  var error = ''.obs;
  final storage = GetStorage();
  var overAllResult = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSumMarks();
  }
  Future<void> fetchSumMarks() async {
    isLoading.value = true;
    String? token = storage.read('userToken');
    if (token != null) {
      studentResults = await repo.fetchSumMarks(token);
      print("studentResults: $studentResults");
    } else {
      print("No token found!");
    }
    update();
    isLoading.value = false;
  }
}