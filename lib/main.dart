import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BusinessLayer/Bindings/init_bindings.dart';
import 'Constants/colors.dart';
import 'Constants/get_pages.dart';
import 'DataAccessLayer/Models/user.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// المعالجة في الخلفية للإشعارات
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Message shows up in background: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // معالجة الإشعارات في الخلفية
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // استمع للإشعارات أثناء تشغيل التطبيق في المقدمة
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Received message while app is in foreground: ${message.notification?.title}, ${message.notification?.body}');

    if (message.notification != null) {
      Get.snackbar(
        message.notification!.title ?? 'Notification',
        message.notification!.body ?? 'No message body',
        snackPosition: SnackPosition.BOTTOM,
        icon: Icon(
          Icons.notifications, // هنا نضع أيقونة الإشعارات
          color: UIColors.yellow,
        ),
        backgroundColor: UIColors.white, // تغيير لون الخلفية
        colorText: UIColors.black, // لون النص
      );
    }
  });

  // تهيئة GetStorage
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static int currentPage = 0;
  static User? appUser;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alnajah',
      initialBinding: InitBinding(),
      getPages: getPages,
    );
  }
}
