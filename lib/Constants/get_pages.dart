import 'package:get/get.dart';
import '../PresentationLayer/Screens/Auth/login_screen.dart';
import '../PresentationLayer/Screens/Auth/registration_screen.dart';
import '../PresentationLayer/Screens/OutUserScreens/out_home_screen.dart';
import '../PresentationLayer/Screens/OutUserScreens/teachers_screen.dart';
import '../PresentationLayer/Screens/Public/adverts_screen.dart';
import '../PresentationLayer/Screens/Public/all_adverts.dart';
import '../PresentationLayer/Screens/Public/arachive_subjects_screen.dart';
import '../PresentationLayer/Screens/Public/courses_screen.dart';
import '../PresentationLayer/Screens/Public/home_screen.dart';
import '../PresentationLayer/Screens/Public/homeworks_screen.dart';
import '../PresentationLayer/Screens/Public/notes_screen.dart';
import '../PresentationLayer/Screens/Public/notifications_screen.dart';
import '../PresentationLayer/Screens/Public/profile_screen.dart';
import '../PresentationLayer/Screens/Public/program_screen.dart';
import '../PresentationLayer/Screens/Public/splash_screen.dart';
import '../PresentationLayer/Screens/Public/subject_files_screen.dart';
import '../PresentationLayer/Screens/Public/subject_images_screen.dart';
import '../PresentationLayer/Screens/Public/subjects_screen.dart';
import '../PresentationLayer/Screens/Public/subjects_with_homework_screen.dart';
import '../PresentationLayer/Screens/Public/years_archive_screen.dart';
import 'get_routes.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.leftToRightWithFade),
  GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      transition: Transition.zoom,),
  GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),),
  GetPage(
    name: AppRoutes.registration,
    page: () =>  RegistrationOrderScreen(),),
  GetPage(
    name: AppRoutes.subjects,
    page: () =>  SubjectsScreen(),),
  GetPage(
    name: AppRoutes.profile,
    page: () =>  ProfileScreen(),),
  GetPage(
    name: AppRoutes.homeworks,
    page: () =>  HomeworksScreen(),),
  GetPage(
    name: AppRoutes.subjectImages,
    page: () =>  SubjectImagesScreen(),),
  GetPage(
    name: AppRoutes.viewImage,
    page: () =>  SubjectImagesScreen(),),
  GetPage(
    name: AppRoutes.subWithHomeworks,
    page: () =>  SubWithHomeworkScreen(),),
  GetPage(
    name: AppRoutes.notifications,
    page: () =>  NotificationsScreen(),),
  GetPage(
    name: AppRoutes.outHomeScreen,
    page: () =>  OutHomeScreen(),),
  GetPage(
    name: AppRoutes.teachers,
    page: () =>  TeachersScreen(),),
  GetPage(
    name: AppRoutes.program,
    page: () =>  ProgramScreen(),),
  GetPage(
    name: AppRoutes.subjectFiles,
    page: () =>  SubjectFilesScreen(),),
  GetPage(
    name: AppRoutes.notes,
    page: () =>  NotesScreen(),),
  GetPage(
    name: AppRoutes.ads,
    page: () =>  AdvertsScreen(),),
  GetPage(
    name: AppRoutes.archiveSubjects,
    page: () =>  ArchiveSubjectsScreen(),),
  GetPage(
    name: AppRoutes.archiveYears,
    page: () =>  YearsArchiveScreen(),),
  GetPage(
    name: AppRoutes.courses,
    page: () =>  CoursesScreen(),),

];
