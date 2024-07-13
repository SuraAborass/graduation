import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../DataAccessLayer/Models/discussion.dart';
import '../../DataAccessLayer/Repositories/disussions_repo.dart';

class DiscussionsController extends GetxController{
  DiscussionsRepo repo = DiscussionsRepo();
  List<Discussion> discussions = [];
  var loading = false.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getDiscussions();
  }

  Future<void> getDiscussions() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1)); // للتأكد من تخزين التوكن قبل قراءته
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    print("Token: $token"); // تأكد من طباعة التوكن
    if (token != null) {
      discussions = await repo.getDiscussions(token);
      print("discussions: $discussions");
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }

}