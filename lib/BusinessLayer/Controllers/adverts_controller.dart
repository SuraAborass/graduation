import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../DataAccessLayer/Models/advert.dart';
import '../../DataAccessLayer/Repositories/adverts_repo.dart';

class AdvertsController extends GetxController {
  AdvertsRepo repo = AdvertsRepo();
  List<Advert> ads = [];
  var loading = false.obs;
  var registeredCourses = <int>{}.obs; // Set to store registered course IDs

  @override
  void onInit() {
    super.onInit();
    getAdverts();
    loadRegisteredCourses(); // Load registered courses on initialization
  }

  Future<void> getAdverts() async {
    loading.value = true;
    try {
      ads = await repo.getAdverts();
      if (ads.isEmpty) {
        print('No ads found.');
      } else {
        ads.forEach((ad) => print(ad.description)); // طباعة وصف كل إعلان
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      update();
      loading.value = false;
    }
  }

  Future<void> loadRegisteredCourses() async {
    final storage = GetStorage();
    final registered = storage.read<List<dynamic>>('registeredCourses') ?? [];
    registeredCourses.addAll(registered.cast<int>());
  }

  Future<void> registerForCourse(int courseId) async {
    final storage = GetStorage();
    final token = storage.read('token');

    if (token == null) {
      Get.snackbar('Error', 'User token is missing.');
      return;
    }

    try {
      final success = await repo.registerCourse(courseId, token);
      if (success) {
        registeredCourses.add(courseId);
        GetStorage().write('registeredCourses', registeredCourses.toList());
        Get.snackbar('Success', 'تم التسجيل بنجاح');
      } else {
        Get.snackbar('Error', 'أنت مسجل بالفعل');
      }
    } catch (e) {
      Get.snackbar('Error', 'حدث خطأ أثناء التسجيل');
    }
    update();
  }
}
