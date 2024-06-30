import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../DataAccessLayer/Models/homework.dart';
import '../../DataAccessLayer/Models/subject_image.dart';
import '../../DataAccessLayer/Models/subject.dart';
import '../../DataAccessLayer/Repositories/subject_repo.dart';

class SubjectsController extends GetxController {
  SubjectsRepo repo = SubjectsRepo();
  List<Subject> subjects = [];
  List<SubjectImage> subjectImages = [];
  List<Homework> homeworks = [];
  var loading = false.obs;
  final storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    await getSubjects();
  }


////////جلب المواد /////
  Future<void> getSubjects() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1)); // للتأكد من تخزين التوكن قبل قراءته
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    print("Token: $token"); // تأكد من طباعة التوكن
    if (token != null) {
      subjects = await repo.getSubjects(token);
      print("Subjects: $subjects"); // تأكد من طباعة المواد بعد جلبها
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }


////////////جلب صور مادة معينة////////////
  Future<void> getSubjectImages(String id) async {
    loading.value = true;
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    print("Token: $token"); // تأكد من طباعة التوكن
    if (token != null) {
      subjectImages = await repo.getSubjectImages(id, token);
      print("Subject Images: $subjectImages"); // تأكد من طباعة صور المادة بعد جلبها
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }

  ////////// جلب وظائف مادة معينة//////
  Future<void> getHomeworks(String id) async {
    loading.value = true;
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    print("Token: $token"); // تأكد من طباعة التوكن
    if (token != null) {
      homeworks = await repo.getHomeworks(id, token);
      print("Subject Homeworks: $homeworks"); // تأكد من طباعة وظائف المادة بعد جلبها
    } else {
      print("No token found!");
    }
    update();
    loading.value = false;
  }
}
