import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../DataAccessLayer/Models/homework.dart';
import '../../DataAccessLayer/Models/subject_image.dart';
import '../../DataAccessLayer/Models/subject.dart';
import '../../DataAccessLayer/Models/subject_file.dart';
import '../../DataAccessLayer/Repositories/subject_repo.dart';

class SubjectsController extends GetxController {
  SubjectsRepo repo = SubjectsRepo();
  List<Subject> subjects = [];
  List<SubjectImage> subjectImages = [];
  List<Homework> homeworks = [];
  List<SubjectFile> subjectFiles = [];
  var loading = false.obs;
  final storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    await getSubjects();
  }

  Future<void> getSubjects() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1)); // للتأكد من تخزين التوكن قبل قراءته
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    if (token != null) {
      subjects = await repo.getSubjects(token);
    }
    update();
    loading.value = false;
  }

  Future<void> getSubjectImages(String id) async {
    loading.value = true;
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    if (token != null) {
      subjectImages = await repo.getSubjectImages(id, token);
    }
    update();
    loading.value = false;
  }

  Future<void> getHomeworks(String id) async {
    loading.value = true;
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    if (token != null) {
      homeworks = await repo.getHomeworks(id, token);
    }
    update();
    loading.value = false;
  }

  Future<void> getSubjectFiles(String id) async {
    loading.value = true;
    String? token = storage.read('userToken'); // قراءة التوكن من GetStorage
    if (token != null) {
      subjectFiles = await repo.getSubjectFiles(id, token);
    }
    update();
    loading.value = false;
  }
}
