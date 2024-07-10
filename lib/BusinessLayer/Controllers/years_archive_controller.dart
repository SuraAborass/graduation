import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../DataAccessLayer/Models/YearArchive.dart';
import '../../DataAccessLayer/Models/subject_file.dart';
import '../../DataAccessLayer/Models/subject_image.dart'; // نموذج SubjectImage
import '../../DataAccessLayer/Repositories/years_archive_repo.dart';

class YearsArchiveController extends GetxController {
  YearsArchiveRepo repo = YearsArchiveRepo();
  List<YearArchive> years = [];
  List<SubjectFile> files = [];
  List<SubjectImage> images = [];
  var loading = false.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getYears(String id) async {
    loading.value = true;
    String? token = storage.read('userToken');
    if (token != null) {
      years = await repo.getYears(id, token);
    }
    update();
    loading.value = false;
  }

  Future<void> getFiles(String subjectId, String year) async {
    loading.value = true;
    String? token = storage.read('userToken');
    if (token != null) {
      files = await repo.getFiles(subjectId, year, token);
    }
    update();
    loading.value = false;
  }

  Future<void> getImages(String subjectId, String year) async {
    loading.value = true;
    String? token = storage.read('userToken');
    if (token != null) {
      images = await repo.getImages(subjectId, year, token);
    }
    update();
    loading.value = false;
  }
}
